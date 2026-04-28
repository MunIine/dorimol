part of 'authorization_bloc.dart';

sealed class AuthorizationState extends Equatable {
  const AuthorizationState();
  
  @override
  List<Object> get props => [];
}

final class AuthorizationInitial extends AuthorizationState {}

final class AuthorizationCodeSend extends AuthorizationState{}

final class AuthorizationVerifying extends AuthorizationState{}

final class AuthorizationSuccess extends AuthorizationState{
  const AuthorizationSuccess({required this.onboardingCompleted});

  final bool onboardingCompleted;

  @override
  List<Object> get props => [onboardingCompleted];
}

final class AuthorizationFailure extends AuthorizationState{
  const AuthorizationFailure({required this.exception});

  final Exception exception;

  @override
  List<Object> get props => [exception];
}