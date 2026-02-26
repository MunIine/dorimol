import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:dorimol/theme/export.dart';

@RoutePage()
class AccountBIOScreen extends StatelessWidget {
  const AccountBIOScreen({
    super.key,
    required this.colorTheme,
  });

  final AppColors colorTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Имя", style: AppText.t2.copyWith(color: colorTheme.iconGray)),
                const SizedBox(height: 4),
                Text("Алексей Груменко", style: AppText.t5.copyWith(color: colorTheme.textBlack)),
              ],
            ),
            const Spacer(),
            Icon(SvgIcons.edit, color: colorTheme.tips, size: 16,)
          ],
        ),
        Divider(
          color: colorTheme.formInput,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Телефон", style: AppText.t2.copyWith(color: colorTheme.iconGray)),
                const SizedBox(height: 4),
                Text("+373 68 123 456", style: AppText.t5.copyWith(color: colorTheme.textBlack)),
              ],
            ),
            const Spacer(),
            Icon(Icons.done_rounded, color: colorTheme.seedColor, size: 20,)
          ],
        ),
        Divider(
          color: colorTheme.formInput,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Адрес", style: AppText.t2.copyWith(color: colorTheme.iconGray)),
                const SizedBox(height: 4),
                Text("Ул. Лермонтова 32", style: AppText.t5.copyWith(color: colorTheme.textBlack)),
              ],
            ),
            const Spacer(),
            Icon(SvgIcons.edit, color: colorTheme.tips, size: 16,)
          ],
        ),
        Divider(
          color: colorTheme.formInput,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Город", style: AppText.t2.copyWith(color: colorTheme.iconGray)),
                const SizedBox(height: 4),
                Text("Тирасполь", style: AppText.t5.copyWith(color: colorTheme.textBlack)),
              ],
            ),
            const Spacer(),
            Icon(SvgIcons.edit, color: colorTheme.tips, size: 16,)
          ],
        ),
      ],
    );
  }
}
