import 'package:flutter/material.dart';
import 'package:dorimol/theme/export.dart';

class ChangeInfoButton extends StatelessWidget {
  const ChangeInfoButton({super.key, required this.colorTheme, required this.onTap, required this.isInfo});

  final AppColors colorTheme;
  final VoidCallback onTap;
  final bool isInfo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 100,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Transform.rotate(
          angle: isInfo ? 3.1415 : 0,
          child: Icon(
            SvgIcons.doubleChevron, 
            color: colorTheme.tips,
          ),
        ),
      ),
    );
  }
}
