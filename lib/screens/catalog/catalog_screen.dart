import 'dart:math';

import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/export.dart';
import 'package:dorimol/widgets/helpers/return_button.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: AppBar(
        leading: ReturnButton(),
        title: Text("Овощи", style: AppText.h2.copyWith(letterSpacing: 2.5, color: colorTheme.seedColor)),
        backgroundColor: Color(0xFFF9F9F9),
        surfaceTintColor: Color(0xFFF9F9F9),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            AppSearchBar(sliders: true),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 185/285
                ), 
                itemBuilder: (context, index) => ItemCard(inCart: [false, true][Random().nextInt(2)], atr: [null, "new", "sale"][Random().nextInt(3)],)
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}