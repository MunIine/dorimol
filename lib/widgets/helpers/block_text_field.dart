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
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    if (controller != null && defaultText != null) controller!.text = defaultText!;

    return Container(
      decoration: BoxDecoration(
        color: form ? colorTheme.formInput : colorTheme.block,
        borderRadius: BorderRadius.circular(12)
      ),
      child: TextField(
        controller: controller,
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
          suffixIcon: icon
        ),
        onSubmitted: onSubmitted
      ),
    );
  }
}