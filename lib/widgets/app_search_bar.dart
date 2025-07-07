import 'package:dorimol/theme/app_colors.dart';
import 'package:dorimol/theme/app_text.dart';
import 'package:dorimol/widgets/svg_icons.dart';
import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key, this.sliders = false});

  final bool sliders;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: colorTheme.block,
              borderRadius: BorderRadius.circular(12)
            ),
            child: TextField(
              style: TextStyle(
                fontSize: 15
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 18),
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: "Найти продукты",
                hintStyle: AppText.t5.copyWith(color: colorTheme.tips)
              ),
            ),
          )
        ),
        if(sliders)...[
          SizedBox(width: 4),
          BoxIconButton(icon: SvgIcons.sliders)
        ],
      ],
    );
  }
}

class BoxIconButton extends StatelessWidget {
  const BoxIconButton({
    super.key, 
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        size: 18.5,
      ),
      onPressed: (){},
      padding: EdgeInsets.all(15),
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12)
        )
      ),
    );
  }
}