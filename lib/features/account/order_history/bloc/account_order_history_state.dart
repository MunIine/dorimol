part of 'account_order_history_bloc.dart';

sealed class AccountOrderHistoryState extends Equatable {
  const AccountOrderHistoryState();
  
  @override
  List<Object> get props => [];
}

final class AccountOrderHistoryInitial extends AccountOrderHistoryState {}

final class AccountOrderHistoryLoading extends AccountOrderHistoryState {}

final class AccountOrderHistoryLoaded extends AccountOrderHistoryState {
  const AccountOrderHistoryLoaded({required this.orders, required this.nextOffset});

  final List<OrderPreview> orders;
  final int? nextOffset;

  @override
  List<Object> get props => [orders, nextOffset ?? -1];
}

final class AccountOrderHistoryFailure extends AccountOrderHistoryState {
  const AccountOrderHistoryFailure({required this.error});

  final Exception error;

  @override
  List<Object> get props => [error];
}