import 'package:bloc/bloc.dart';
import 'package:dorimol/data/exceptions.dart';
import 'package:dorimol/models/access_token_payload.dart';
import 'package:dorimol/models/firebase_auth_anwer.dart';
import 'package:dorimol/data/services/auth_service.dart';
import 'package:dorimol/data/services/token_service.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc({required this.authService, required this.tokenService}) : super(AuthorizationInitial()) {
    on<CheckAuthorization>((event, emit) async {
      try {
        final AccessTokenPayload accessTokenPayload = tokenService.parseAccessToken();
        GetIt.I<Talker>().info("User authorized");
        emit(AuthorizationSuccess(onboardingCompleted: accessTokenPayload.onboardingComplete));
      } on TokenException catch (_) {
        GetIt.I<Talker>().info("User not authorized");
      }
    });
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
          final idToken = await user.getIdToken();
          final FirebaseAuthAnwer firebaseAuthAnwer = await authService.getJwtToken(idToken!);
          await tokenService.saveTokens(accessToken: firebaseAuthAnwer.accessToken, refreshToken: firebaseAuthAnwer.refreshToken);
          final AccessTokenPayload accessTokenPayload = tokenService.parseAccessToken();
          emit(AuthorizationSuccess(onboardingCompleted: accessTokenPayload.onboardingComplete));
        } else {
          emit(AuthorizationFailure(exception: Exception("User is null")));
        }
      } on Exception catch (e) {
        emit(AuthorizationFailure(exception: e));
      }
    });
  }

  final AuthService authService;
  final TokenService tokenService;
}
