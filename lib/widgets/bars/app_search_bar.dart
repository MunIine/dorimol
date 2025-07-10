import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/bars/sorting_bottom_sheet.dart';
import 'package:dorimol/widgets/helpers/block_text_field.dart';
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
          child: BlockTextField(colorTheme: colorTheme, hint: "Найти продукты",)
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
      onPressed: () => showModalBottomSheet(
        backgroundColor: Theme.of(context).extension<AppColors>()!.background,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
        context: context,
        builder: (context) => SortingBottomSheet()
      ),
      padding: EdgeInsets.all(15),
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12)
        )
      ),
    );
  }
}