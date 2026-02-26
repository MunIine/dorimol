import 'package:flutter/material.dart';
import 'package:dorimol/theme/export.dart';

class CurrentBlock extends StatelessWidget {
  const CurrentBlock({super.key, required this.colorTheme});

  final AppColors colorTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Текущая скидка 0%", style: AppText.b6.copyWith(color: colorTheme.textGray)),
        const SizedBox(height: 12),
        Text("Осталось 3 заказа", style: AppText.t2.copyWith(color: colorTheme.textGray)),
        Stack(
          children: [
            SizedBox(
              height: 16,
              child: LinearProgressIndicator(
                value: 0.3,
                borderRadius: BorderRadius.circular(16),
                backgroundColor: const Color(0xFFCDFFE4),
              ),
            ),
            Positioned(
              right: 20,
              child: Text("Скидка 3%", style: AppText.t1.copyWith(color: colorTheme.seedColor)),
            ),
          ],
        ),
      ],
    );
  }
}
