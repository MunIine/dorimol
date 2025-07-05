import 'package:dorimol/theme/theme.dart';
import 'package:dorimol/widgets/svg_icons.dart';
import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key, this.bookmark = false});

  final bool bookmark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: blockColor,
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
                hintStyle: TextStyle(
                  color: tipsColor,
                  fontSize: 15
                )
              ),
            ),
          )
        ),
        SizedBox(width: 4),
        BoxIconButton(icon: SvgIcons.filter),
        if(bookmark)...[
          SizedBox(width: 4),
          BoxIconButton(icon: SvgIcons.bookmark)
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