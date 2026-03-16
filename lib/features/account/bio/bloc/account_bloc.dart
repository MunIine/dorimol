import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dorimol/api/private_api_client.dart';
import 'package:dorimol/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial()) {
    on<FetchAccountInfo>((event, emit) async {
      try {
        emit(AccountLoading());
        final user = await apiClient.getCurrentUser();
        emit(AccountLoaded(user: user));
      } on Exception catch (e) {
        emit(AccountFailure(error: e));
      }
    });
    on<ToggleEditMode>((event, emit) {
      if (state is AccountLoaded) {
        final currentState = state as AccountLoaded;
        emit(currentState.copyWith(editMode: !currentState.editMode));
      }
    });
    on<UpdateAccountBio>((event, emit) async {
      try {
        User user = (state as AccountLoaded).user;

        if (event.avatar != null) {
          user = await apiClient.updateUserAvatar(event.avatar!);
        };
        if (event.body.isNotEmpty) {
          user = await apiClient.updateUser(event.body);
        }
        emit(AccountLoaded(user: user));
      } on Exception catch (e) {
        emit(AccountFailure(error: e));
      }
    });
  }

  final PrivateApiClient apiClient = GetIt.I<PrivateApiClient>();
}
