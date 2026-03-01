part of 'account_bloc.dart';

sealed class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class FetchAccountInfo extends AccountEvent {
  const FetchAccountInfo();

  @override
  List<Object> get props => [];
}