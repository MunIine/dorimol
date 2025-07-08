import 'package:dorimol/theme/app_colors.dart';
import 'package:dorimol/theme/app_text.dart';
import 'package:dorimol/widgets/export.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 155, 155, 155),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          style: IconButton.styleFrom(
            backgroundColor: Color(0xFFF9F9F9)
          ),
          icon: Transform.rotate(
            angle: 3.14159,
            child: Icon(SvgIcons.back)
          )
        ),
        title: Text("Овощи", style: AppText.h2.copyWith(letterSpacing: 2.5, color: colorTheme.seedColor)),
        backgroundColor: Color(0xFFF9F9F9),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            AppSearchBar(sliders: true),
            ItemCard(inCart: true)
          ],
        ),
      ),
    );
  }
}