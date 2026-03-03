part of 'account_order_history_bloc.dart';

sealed class AccountOrderHistoryEvent extends Equatable {
  const AccountOrderHistoryEvent();

  @override
  List<Object> get props => [];
}

class FetchAccountOrders extends AccountOrderHistoryEvent {
  const FetchAccountOrders();
}