import 'package:dorimol/models/user.dart';
import 'package:flutter/material.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/features/account/widgets/content_block.dart';
import 'package:dorimol/features/account/widgets/change_info_button.dart';

class AccountPersonalSale extends StatefulWidget {
  const AccountPersonalSale({
    super.key,
    required this.colorTheme,
    required this.user
  });

  final AppColors colorTheme;
  final User user;

  @override
  State<AccountPersonalSale> createState() => _AccountPersonalSaleState();
}

class _AccountPersonalSaleState extends State<AccountPersonalSale> {
  bool isInfo = false;

  void toggleInfo() {
    setState(() {
      isInfo = !isInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isInfo) ChangeInfoButton(colorTheme: widget.colorTheme, onTap: toggleInfo, isInfo: isInfo),
        if (isInfo) const SizedBox(width: 6),
        ContentBlock(colorTheme: widget.colorTheme, user: widget.user, isInfo: isInfo),
        if (!isInfo) const SizedBox(width: 6),
        if (!isInfo) ChangeInfoButton(colorTheme: widget.colorTheme, onTap: toggleInfo, isInfo: isInfo)
      ],
    );
  }
}

