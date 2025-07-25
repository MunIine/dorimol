import 'package:dorimol/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BlockTextField extends StatelessWidget {
  const BlockTextField({
    super.key,
    required this.colorTheme, 
    required this.onSubmitted, 
    required this.hint,
    this.defaultText, 
    this.controller, 
    this.form = false,
    this.enabled = true, 
    this.useIcon = false,
    this.icon, 
    this.keyboardType, 
  });

  final AppColors colorTheme;
  final ValueChanged<String> onSubmitted;
  final String? defaultText;
  final TextEditingController? controller;
  final bool form;
  final bool enabled;
  final String hint;
  final Widget? icon;
  final bool useIcon;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    if (controller != null && defaultText != null) controller!.text = defaultText!;
    final TextEditingController effectiveController = controller ?? TextEditingController();

    Widget? suffix;
    if (icon != null) {
      suffix = icon;
    } else if (useIcon && effectiveController.text.trim().isNotEmpty) {
      suffix = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Icon(Icons.done_rounded, color: colorTheme.seedColor, size: 16),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: form ? colorTheme.formInput : colorTheme.block,
        borderRadius: BorderRadius.circular(12)
      ),
      child: TextField(
        controller: effectiveController,
        enabled: enabled,
        keyboardType: keyboardType,
        style: TextStyle(
          fontSize: 15
        ),
        decoration: InputDecoration(
          hintText: hint,
          suffixIconConstraints: BoxConstraints(
            minHeight: 0,
            minWidth: 0
          ),
          suffixIcon: suffix
        ),
        onSubmitted: onSubmitted
      ),
    );
  }
}