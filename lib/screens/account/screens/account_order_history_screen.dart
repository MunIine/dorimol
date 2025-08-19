import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:dorimol/theme/export.dart';

@RoutePage()
class AccountOrderHistoryScreen extends StatelessWidget {
  const AccountOrderHistoryScreen({super.key, required this.colorTheme});

  final AppColors colorTheme;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          title: RichText(
            text: TextSpan(
              style: AppText.rostelecom,
              children: <TextSpan>[
                TextSpan(
                  text: "[12.08.2025]",
                  style: AppText.t2.copyWith(color: colorTheme.lopyGreen),
                ),
                TextSpan(
                  text: "  Заказ номер 1",
                  style: AppText.t2.copyWith(color: colorTheme.iconGray),
                ),
              ],
            ),
          ),
          subtitle: Text(
            "Тирасполь, ул. Карла маркса 52",
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
}
