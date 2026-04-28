import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionDialog extends StatelessWidget {
  const PermissionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return AlertDialog(
      title: Text('Отсутствует доступ к фото', style: AppText.h1.copyWith(color: colorTheme.textBlack)),
      content: Text(
        'Чтобы изменить фото профиля, разрешите доступ к галерее в настройках устройства.',
        style: AppText.t5.copyWith(color: colorTheme.textBlack)
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
              backgroundColor: colorTheme.red.withAlpha(220),
            ),
            child: Text('Отмена', style: AppText.b6.copyWith(color: Colors.white)),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings();
            },
            style: TextButton.styleFrom(
              backgroundColor: colorTheme.lopyGreen
            ),
            child: Text('Открыть настройки', style: AppText.b6.copyWith(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}