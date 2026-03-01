part of 'account_bloc.dart';

sealed class AccountState extends Equatable {
  const AccountState();
  
  @override
  List<Object> get props => [];
}

final class AccountInitial extends AccountState {}

final class AccountLoading extends AccountState {}

final class AccountLoaded extends AccountState {
  const AccountLoaded({required this.user});

  final User user;

  @override
  List<Object> get props => [user];
}

final class AccountFailure extends AccountState {
  const AccountFailure({required this.error});

  final Exception error;

  @override
  List<Object> get props => [error];
}