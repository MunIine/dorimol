import 'package:dorimol/app.dart';
import 'package:dorimol/data/app_config.dart';
import 'package:dorimol/models/user.dart';
import 'package:flutter/material.dart';
import 'package:dorimol/theme/export.dart';

class AccountAppBar extends StatelessWidget {
  const AccountAppBar({
    super.key,
    required this.colorTheme,
    required this.user,
  });

  final AppColors colorTheme;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () => context.findAncestorStateOfType<MyAppState>()?.logout(),
              style: IconButton.styleFrom(backgroundColor: Colors.transparent),
              icon: Icon(Icons.logout_rounded, color: colorTheme.red)
            ),
          ),
          Center(
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey[300],
                    image: user.image_url != null ? DecorationImage(
                      image: NetworkImage(
                        Uri.parse(AppConfig.apiUrl).resolve(user.image_url!).toString(),
                      ),
                      fit: BoxFit.cover,
                    ) : null,
                  ),
                ),
                Text(user.name, style: AppText.h1.copyWith(color: colorTheme.textGray)),
                Text("Оформлено заказов: ${user.orders_amount}", style: AppText.b1.copyWith(color: colorTheme.tips)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
