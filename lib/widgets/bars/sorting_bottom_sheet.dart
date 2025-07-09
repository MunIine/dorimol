import 'dart:math';

import 'package:dorimol/theme/app_colors.dart';
import 'package:dorimol/theme/app_text.dart';
import 'package:dorimol/widgets/export.dart';
import 'package:flutter/material.dart';

class SortingBottomSheet extends StatelessWidget {
  const SortingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return SizedBox(
      height: 430,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(), 
                  icon: Icon(
                    SvgIcons.xCirleFilled,
                    color: colorTheme.tips,
                  )
                ),
                Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Сортировка", style: AppText.h1.copyWith(color: colorTheme.textBlack),),
                    Text("Сохраняется, пока вы их не отмените", style: AppText.t3.copyWith(color: colorTheme.iconGray)),
                  ],
                ),
                Spacer(),
                SizedBox(width: 24)
              ],
            ),
            SizedBox(height: 10),
            Divider(),
            SortingListElement(text: "По возрастанию цены"),
            Divider(),
            SortingListElement(text: "По убыванию цены"),
            Divider(),
            SortingListElement(text: "По популярности"),
            Divider(),
            SortingListElement(text: "По новинкам"),
            Divider(),
            SortingListElement(text: "По скидкам"),
            Divider(),
          ],
        ),
      ),
    );
  }
}

class SortingListElement extends StatelessWidget {
  const SortingListElement({
    super.key, required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return GestureDetector(
      onTap: () {
        
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: AppText.t6.copyWith(color: Color(0xFF626262))),
            [Icon(SvgIcons.radioButtonOn, color: colorTheme.seedColor), Icon(SvgIcons.radioButtonOff, color: colorTheme.block)][Random().nextInt(2)]
          ],
        ),
      ),
    );
  }
}