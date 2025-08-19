import 'package:flutter/material.dart';
import 'package:dorimol/theme/export.dart';
import 'info_block.dart';
import 'current_block.dart';

class ContentBlock extends StatelessWidget {
  const ContentBlock({super.key, required this.colorTheme, required this.isInfo});

  final AppColors colorTheme;
  final bool isInfo;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: isInfo ? InfoBlock(colorTheme: colorTheme) : CurrentBlock(colorTheme: colorTheme),
      ),
    );
  }
}
