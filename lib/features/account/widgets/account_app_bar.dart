import 'dart:io';
import 'package:dorimol/app.dart';
import 'package:dorimol/data/app_config.dart';
import 'package:dorimol/data/services/ui_service.dart';
import 'package:dorimol/features/account/bio/bloc/account_bloc.dart';
import 'package:dorimol/models/user.dart';
import 'package:flutter/material.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;

class AccountAppBar extends StatefulWidget {
  const AccountAppBar({
    super.key,
    required this.colorTheme,
    required this.editMode,
    required this.user,
    required this.pendingAvatarNotifier
  });

  final AppColors colorTheme;
  final bool editMode;
  final User user;
  final ValueNotifier<File?> pendingAvatarNotifier;

  @override
  State<AccountAppBar> createState() => _AccountAppBarState();
}

class _AccountAppBarState extends State<AccountAppBar> {
  bool _isPicking = false;

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
              icon: Icon(Icons.logout_rounded, color: widget.colorTheme.red)
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                context.read<AccountBloc>().add(const ToggleEditMode());
                context.read<NavBarController>().toggle();
                widget.pendingAvatarNotifier.value = null;
              },
              style: IconButton.styleFrom(backgroundColor: Colors.transparent),
              icon: Icon(widget.editMode ? SvgIcons.x : SvgIcons.edit, color: widget.colorTheme.tips)
            ),
          ),
          Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: widget.pendingAvatarNotifier,
                      builder: (context, value, child) {
                        return Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey[300],
                            image: getImage(value),
                          ),
                        );
                      }
                    ),
                    AnimatedOpacity(
                      opacity: widget.editMode ? 0.5 : 0.0,
                      duration: const Duration(milliseconds: 250),
                      child: GestureDetector(
                        onTap: pickImage,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.black,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.add_rounded,
                              color: Colors.white,
                              size: 48,
                            ),
                          ),
                        ),
                      ),
                    )
                  ]
                ),
                Text(widget.user.name, style: AppText.h1.copyWith(color: widget.colorTheme.textGray)),
                Text("Оформлено заказов: ${widget.user.orders_amount}", style: AppText.b1.copyWith(color: widget.colorTheme.tips)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void pickImage() async {
    if (_isPicking) return;
    _isPicking = true;
    try{
      final status = await Permission.photos.request();
      if (!status.isGranted) {
        // TODO: Ответ при отсутствии разрешения
        print("Разрешение на доступ к фото не предоставлено");
        return;
      }
      final picker = ImagePicker();
      final XFile? file = await picker.pickImage(source: ImageSource.gallery);

      if (file == null) return;

      final ext = path.extension(file.path).replaceFirst('.', '').toLowerCase();
      if (!AppConfig.allowedUploadFileExtensions.contains(ext)) {
        print("Неверный формат. Выберите PNG, JPG или WEBP.");
        return;
      }

      final sizeInBytes = await file.length();
      if (sizeInBytes > AppConfig.maxUploadFileSize) {
        print("Файл слишком большой. Максимум 5 МБ.");
        return;
      }

      widget.pendingAvatarNotifier.value = File(file.path);
    } finally{
      _isPicking = false;
    }
  }

  DecorationImage? getImage(pendingImage){
    if (widget.editMode){
      return widget.user.image_url != null || pendingImage != null ? DecorationImage(
        image: pendingImage != null ? FileImage(pendingImage) : NetworkImage(
          Uri.parse(AppConfig.apiUrl).resolve(widget.user.image_url!).toString(),
        ),
        fit: BoxFit.cover,
      ) : null;
    }
    return widget.user.image_url != null ? DecorationImage(
      image: NetworkImage(
        Uri.parse(AppConfig.apiUrl).resolve(widget.user.image_url!).toString(),
      ),
      fit: BoxFit.cover,
    ) : null;
  }
}
