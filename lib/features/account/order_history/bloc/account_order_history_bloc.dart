import 'package:dorimol/data/app_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dorimol/api/private_api_client.dart';
import 'package:dorimol/models/order_preview.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'account_order_history_event.dart';
part 'account_order_history_state.dart';

class AccountOrderHistoryBloc extends Bloc<AccountOrderHistoryEvent, AccountOrderHistoryState> {
  AccountOrderHistoryBloc() : super(AccountOrderHistoryInitial()) {
    on<FetchAccountOrders>((event, emit) async {
      try {
        List<OrderPreview> orders = [];
        if (state is AccountOrderHistoryLoaded && event.offset != 0){
          orders = (state as AccountOrderHistoryLoaded).orders;
        }else{
          emit(AccountOrderHistoryLoading());
        }
        final response = await apiClient.getUserOrders(event.offset, event.limit);
        orders.addAll(response.orders);
        emit(AccountOrderHistoryLoaded(orders: orders, nextOffset: response.nextOffset));
      }
      on Exception catch (e) {
        emit(AccountOrderHistoryFailure(error: e));
      }
    });
  }

  final PrivateApiClient apiClient = GetIt.I<PrivateApiClient>();
}
