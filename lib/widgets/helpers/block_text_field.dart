import 'package:dorimol/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BlockTextField extends StatelessWidget {
  const BlockTextField({
    super.key,
    required this.colorTheme, 
    required this.hint, 
    this.form = false,
    this.enabled = true, 
    this.icon, 
  });

  final AppColors colorTheme;
  final bool form;
  final bool enabled;
  final String hint;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: form ? colorTheme.formInput : colorTheme.block,
        borderRadius: BorderRadius.circular(12)
      ),
      child: TextField(
        enabled: enabled,
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
      ),
    );
  }
}