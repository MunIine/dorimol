part of 'authorization_bloc.dart';

sealed class AuthorizationEvent extends Equatable {
  const AuthorizationEvent();

  @override
  List<Object> get props => [];
}

class SendCode extends AuthorizationEvent {
  const SendCode({required this.phone});

  final String phone;
  
  @override
  List<Object> get props => [phone];
}

class VerifyCode extends AuthorizationEvent {
  const VerifyCode({required this.smsCode});

  final String smsCode;
  
  @override
  List<Object> get props => [smsCode];
}

class ResendCode extends AuthorizationEvent {
  const ResendCode({required this.phone});

  final String phone;
  
  @override
  List<Object> get props => [phone];
}
