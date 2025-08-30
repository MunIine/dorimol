import 'package:bloc/bloc.dart';
import 'package:dorimol/data/services/auth_sevice.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc({required this.authService}) : super(AuthorizationInitial()) {
    on<SendCode>((event, emit) async {
      try {
        await authService.signIn(phone: event.phone);
        emit(AuthorizationCodeSend());
      } on Exception catch (e) {
        emit(AuthorizationFailure(exception: e));
      }
    });
    on<VerifyCode>((event, emit) async {
      emit(AuthorizationVerifying());
      try {
        final userCredential = await authService.verifyCode(event.smsCode);
        final user = userCredential.user;
        if (user != null) {
          emit(AuthorizationSuccess(user: user));
        } else {
          emit(AuthorizationFailure(exception: Exception("User is null")));
        }
      } on Exception catch (e) {
        emit(AuthorizationFailure(exception: e));
      }
    });
  }

  final AuthService authService;
}
