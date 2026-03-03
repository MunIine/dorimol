import 'package:auto_route/auto_route.dart';
import 'package:dorimol/features/account/order_history/bloc/account_order_history_bloc.dart';
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

            return ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: RichText(
                    text: TextSpan(
                      style: AppText.rostelecom,
                      children: <TextSpan>[
                        TextSpan(
                          text: orders[index].status,
                          style: AppText.t3.copyWith(color: colorTheme.lopyGreen),
                        ),
                        const TextSpan(text: "  "),
                        TextSpan(
                          text: "Сумма: ${orders[index].totalPrice} руб",
                          style: AppText.t3.copyWith(color: colorTheme.iconGray),
                        ),
                      ],
                    ),
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
