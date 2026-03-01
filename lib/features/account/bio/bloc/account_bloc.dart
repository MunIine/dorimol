import 'package:bloc/bloc.dart';
import 'package:dorimol/api/private_api_client.dart';
import 'package:dorimol/models/user.dart';
import 'package:equatable/equatable.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc({required this.apiClient}) : super(AccountInitial()) {
    on<FetchAccountInfo>((event, emit) async {
      try {
        emit(AccountLoading());
        final user = await apiClient.getCurrentUser();
        emit(AccountLoaded(user: user));
      } on Exception catch (e) {
        emit(AccountFailure(error: e));
      }
    });
  }

  final PrivateApiClient apiClient;
}
