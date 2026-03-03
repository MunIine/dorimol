import 'package:flutter/material.dart';
import 'package:dorimol/theme/export.dart';

class InfoBlock extends StatelessWidget {
  const InfoBlock({super.key, required this.colorTheme});

  final AppColors colorTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: colorTheme.lopyGreen.withAlpha(38),
              ),
              child: Text("3%", style: AppText.b3.copyWith(color: colorTheme.seedColor)),
            ),
            const SizedBox(width: 10),
            Text("Осталось 3 заказа", style: AppText.t3.copyWith(color: colorTheme.textGray))
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: colorTheme.exyBlue.withAlpha(38),
              ),
              child: Text("5%", style: AppText.b3.copyWith(color: colorTheme.exyBlue)),
            ),
            const SizedBox(width: 10),
            Text("Осталось 6 заказа", style: AppText.t3.copyWith(color: colorTheme.textGray))
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: colorTheme.red.withAlpha(38),
              ),
              child: Text("7%", style: AppText.b3.copyWith(color: colorTheme.mlineRed)),
            ),
            const SizedBox(width: 10),
            Text("Осталось 10 заказа", style: AppText.t3.copyWith(color: colorTheme.textGray))
          ],
        )
      ],
    );
  }
}
