import 'package:dorimol/models/user.dart';
import 'package:flutter/material.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/features/account/widgets/info_block.dart';
import 'package:dorimol/features/account/widgets/current_block.dart';

class ContentBlock extends StatelessWidget {
  const ContentBlock({
    super.key, 
    required this.colorTheme,
    required this.user,
    required this.isInfo
  });

  final AppColors colorTheme;
  final User user;
  final bool isInfo;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: isInfo ? InfoBlock(colorTheme: colorTheme, user: user) : CurrentBlock(colorTheme: colorTheme, user: user),
      ),
    );
  }
}
