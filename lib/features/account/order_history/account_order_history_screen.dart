import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dorimol/data/constants.dart';
import 'package:dorimol/data/services/ui_service.dart';
import 'package:dorimol/features/account/order_history/bloc/account_order_history_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AccountOrderHistoryScreen extends StatefulWidget {
  const AccountOrderHistoryScreen({super.key, required this.colorTheme});

  final AppColors colorTheme;

  @override
  State<AccountOrderHistoryScreen> createState() => _AccountOrderHistoryScreenState();
}

class _AccountOrderHistoryScreenState extends State<AccountOrderHistoryScreen> {
  late final AccountOrderHistoryBloc _bloc;
  late final StreamSubscription _blocSubscription;
  late final NavBarController navBarController;
  final scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    _bloc = AccountOrderHistoryBloc()..add(const FetchAccountOrders());
    _blocSubscription = _bloc.stream.listen((state) {
      if (state is! AccountOrderHistoryLoaded) return;
      if (state.nextOffset == null) return;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!scrollController.hasClients) return;
        if (scrollController.position.maxScrollExtent == 0) {
          _bloc.add(FetchAccountOrders(offset: state.nextOffset!));
        }
      });
    });

    navBarController = context.read<NavBarController>();
    navBarController.attachScrollController(scrollController);

    scrollController.addListener((){
      if (scrollController.position.atEdge && scrollController.position.maxScrollExtent != 0) loadNext();
    });
  }

  void loadNext(){
    final state = _bloc.state;
    
    if (state is! AccountOrderHistoryLoaded) return;
    if (state.nextOffset == null) return;
    
    _bloc.add(FetchAccountOrders(offset: state.nextOffset!));
  }

  @override
  void dispose() {
    _blocSubscription.cancel();
    scrollController.dispose();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocBuilder<AccountOrderHistoryBloc, AccountOrderHistoryState>(
        builder: (context, state) {
          if (state is AccountOrderHistoryLoaded){
            final orders = state.orders;
            if (orders.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Оформите свой первый заказ", style: AppText.b7.copyWith(color: widget.colorTheme.textBlack)),
                    const SizedBox(height: 16),
                    const SizedBox(width: 210, height: 210, child: Image(image: AssetImage("lib/assets/errors/no_items.png"))),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              displacement: 15,
              backgroundColor: widget.colorTheme.background,
              color: widget.colorTheme.seedColor,
              onRefresh: () async => context.read<AccountOrderHistoryBloc>().add(const FetchAccountOrders()),
              child: ListView.separated(
                controller: scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 45),
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: widget.colorTheme.backgroundForOrderStatus(orders[index].status),
                              ),
                              child: Text(
                                orders[index].status.label,
                                style: AppText.t2.copyWith(color: widget.colorTheme.colorForOrderStatus(orders[index].status)),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Сумма: ${orders[index].totalPrice} руб",
                              style: AppText.t3.copyWith(color: widget.colorTheme.iconGray),
                            )
                          ],
                        ),
                        const SizedBox(height: 4)
                      ],
                    ),
                    subtitle: Text(
                      "${orders[index].createdAt.day}.${orders[index].createdAt.month}.${orders[index].createdAt.year} | ${
                        orders[index].deliveryType == DeliveryType.courier ? 
                        '${orders[index].city}, ${orders[index].address}' :
                        'Самовывоз'
                      }",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppText.t5.copyWith(color: widget.colorTheme.textBlack),
                    ),
                    trailing: Icon(SvgIcons.back, color: widget.colorTheme.iconGray),
                    onTap: () {
                      // Navigate to order details
                    },
                  );
                },
                separatorBuilder: (context, index) => Divider(color: widget.colorTheme.formInput, height: 1, endIndent: 25, indent: 18),
              ),
            );
          }
          if (state is AccountOrderHistoryFailure) {
            return  Padding(
              padding: const EdgeInsets.only(top: 64),
              child: Column(
                children: [
                  Icon(
                    Icons.error_outline_rounded, 
                    size: 80,
                    color: widget.colorTheme.red.withAlpha(220),
                  ),
                  const SizedBox(height: 3),
                  Text("Что-то пошло не так", style: AppText.b7.copyWith(color: widget.colorTheme.textBlack)),
                  const SizedBox(height: 3),
                  TextButton(
                    onPressed: () => context.read<AccountOrderHistoryBloc>().add(const FetchAccountOrders()),
                    style: TextButton.styleFrom(
                      backgroundColor: widget.colorTheme.iconGray, 
                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14)
                    ),
                    child: Text("Попробовать ещё раз", style: AppText.b7.copyWith(color: widget.colorTheme.background))
                  )
                ],
              ),
            );
            // AutoRouter.of(context).replace(ErrorRoute(exception: state.error));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
