import 'dart:io';
import 'package:dorimol/app.dart';
import 'package:dorimol/data/app_config.dart';
import 'package:dorimol/data/services/ui_service.dart';
import 'package:dorimol/features/account/bio/bloc/account_bloc.dart';
import 'package:dorimol/models/user.dart';
import 'package:dorimol/widgets/pop_up/permission_dialog.dart';
import 'package:flutter/material.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;
import 'package:talker_flutter/talker_flutter.dart';

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
  final double _defaultPadding = 20;
  final double _errorBottomPadding = 4;
  bool _isPicking = false;
  String? _avatarErrorMessage;

  @override
  Widget build(BuildContext context) {
    if (!widget.editMode) _avatarErrorMessage = null;

    return Container(
      width: double.infinity,
      // Предотвращает дерганье ui из-за изменения размера appbar
      padding: EdgeInsets.all(_defaultPadding).copyWith(bottom: _avatarErrorMessage == null ? _defaultPadding : _errorBottomPadding), 
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
                if (_avatarErrorMessage != null) Text(_avatarErrorMessage!, style: AppText.b3.copyWith(color: widget.colorTheme.red, height: 1.2)),
                Text(widget.user.name, style: AppText.h1.copyWith(color: widget.colorTheme.textGray)),
                Text("Оформлено заказов: ${widget.user.ordersAmount}", style: AppText.b1.copyWith(color: widget.colorTheme.tips)),
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
        GetIt.I<Talker>().info("Missing media permission");
        if (!mounted) return;
        showDialog(context: context, builder: (context) => const PermissionDialog());
        return;
      }
      final picker = ImagePicker();
      final XFile? file = await picker.pickImage(source: ImageSource.gallery);

      if (file == null) return;

      final ext = path.extension(file.path).replaceFirst('.', '').toLowerCase();
      if (!AppConfig.allowedUploadFileExtensions.contains(ext)) {
        GetIt.I<Talker>().info("Incorrect image format");
        setState(() {
          _avatarErrorMessage = "Неверный формат изображения";
        });
        return;
      }

      final sizeInBytes = await file.length();
      if (sizeInBytes > AppConfig.maxUploadFileSize) {
        GetIt.I<Talker>().info("Image too large");
        setState(() {
          _avatarErrorMessage = "Файл слишком большой. Максимум 5 МБ";
        });
        return;
      }

      if (_avatarErrorMessage != null){
        setState(() {
          _avatarErrorMessage = null;
        });
      }
      widget.pendingAvatarNotifier.value = File(file.path);
    } finally{
      _isPicking = false;
    }
  }

  DecorationImage? getImage(File? pendingImage){
    if (widget.editMode){
      return widget.user.imageUrl != null || pendingImage != null ? DecorationImage(
        image: pendingImage != null ? FileImage(pendingImage) : NetworkImage(
          Uri.parse(AppConfig.apiUrl).resolve(widget.user.imageUrl!).toString(),
        ),
        fit: BoxFit.cover,
      ) : null;
    }
    return widget.user.imageUrl != null ? DecorationImage(
      image: NetworkImage(
        Uri.parse(AppConfig.apiUrl).resolve(widget.user.imageUrl!).toString(),
      ),
      fit: BoxFit.cover,
    ) : null;
  }
}
