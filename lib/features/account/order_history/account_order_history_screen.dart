import 'package:auto_route/auto_route.dart';
import 'package:dorimol/features/account/order_history/bloc/account_order_history_bloc.dart';
import 'package:dorimol/models/order_statuses.dart';
import 'package:dorimol/router/router.dart';
import 'package:flutter/material.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AccountOrderHistoryScreen extends StatelessWidget {
  const AccountOrderHistoryScreen({super.key, required this.colorTheme});

  final AppColors colorTheme;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountOrderHistoryBloc()..add(const FetchAccountOrders()),
      child: BlocBuilder<AccountOrderHistoryBloc, AccountOrderHistoryState>(
        builder: (context, state) {
          if (state is AccountOrderHistoryLoaded){
            final orders = state.orders;

            return RefreshIndicator(
              displacement: 15,
              backgroundColor: colorTheme.background,
              color: colorTheme.seedColor,
              onRefresh: () async => context.read<AccountOrderHistoryBloc>().add(const FetchAccountOrders()),
              child: ListView.separated(
                padding: const EdgeInsets.only(bottom: 45),
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    // title: RichText(
                    //   text: TextSpan(
                    //     style: AppText.rostelecom,
                    //     children: <TextSpan>[
                    //       TextSpan(
                    //         text: orders[index].status.label,
                    //         style: AppText.t3.copyWith(color: colorTheme.colorForOrderStatus(orders[index].status)),
                    //       ),
                    //       const TextSpan(text: "  "),
                    //       TextSpan(
                    //         text: "Сумма: ${orders[index].totalPrice} руб",
                    //         style: AppText.t3.copyWith(color: colorTheme.iconGray),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    title: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: colorTheme.backgroundForOrderStatus(orders[index].status),
                              ),
                              child: Text(
                                orders[index].status.label,
                                style: AppText.t2.copyWith(color: colorTheme.colorForOrderStatus(orders[index].status)),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Сумма: ${orders[index].totalPrice} руб",
                              style: AppText.t3.copyWith(color: colorTheme.iconGray),
                            )
                          ],
                        ),
                        const SizedBox(height: 4)
                      ],
                    ),
                    subtitle: Text(
                      "${orders[index].createdAt.day}.${orders[index].createdAt.month}.${orders[index].createdAt.year} | ${
                        orders[index].city != null && orders[index].address != null ? 
                        '${orders[index].city}, ${orders[index].address}' :
                        'Самовывоз'
                      }",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppText.t5.copyWith(color: colorTheme.textBlack),
                    ),
                    trailing: Icon(SvgIcons.back, color: colorTheme.iconGray),
                    onTap: () {
                      // Navigate to order details
                    },
                  );
                },
                separatorBuilder: (context, index) => Divider(color: colorTheme.formInput, height: 1, endIndent: 25, indent: 18),
              ),
            );
          }
          if (state is AccountOrderHistoryFailure) {
            AutoRouter.of(context).replace(ErrorRoute(exception: state.error));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
