import 'package:flutter/material.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/screens/account/widgets/info_block.dart';
import 'package:dorimol/screens/account/widgets/current_block.dart';

class ContentBlock extends StatelessWidget {
  const ContentBlock({super.key, required this.colorTheme, required this.isInfo});

  final AppColors colorTheme;
  final bool isInfo;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: isInfo ? InfoBlock(colorTheme: colorTheme) : CurrentBlock(colorTheme: colorTheme),
      ),
    );
  }
}
