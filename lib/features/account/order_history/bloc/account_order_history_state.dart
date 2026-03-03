part of 'account_order_history_bloc.dart';

sealed class AccountOrderHistoryState extends Equatable {
  const AccountOrderHistoryState();
  
  @override
  List<Object> get props => [];
}

final class AccountOrderHistoryInitial extends AccountOrderHistoryState {}

final class AccountOrderHistoryLoading extends AccountOrderHistoryState {}

final class AccountOrderHistoryLoaded extends AccountOrderHistoryState {
  const AccountOrderHistoryLoaded({required this.orders});

  final List<OrderPreview> orders;

  @override
  List<Object> get props => [orders];
}

final class AccountOrderHistoryFailure extends AccountOrderHistoryState {
  const AccountOrderHistoryFailure({required this.error});

  final Exception error;

  @override
  List<Object> get props => [error];
}