import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

class RatingBlock extends StatelessWidget {
  const RatingBlock({
    super.key, 
    this.useStarTextColor = false,
    required this.rating, 
    required this.borderRadius,
    required this.style, 
    required this.iconSize, 
    required this.padding, 
  });

  final double rating;
  final bool useStarTextColor;
  final double borderRadius;
  final EdgeInsets padding;
  final TextStyle style;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: colorTheme.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius)
        )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.star_rounded, color: colorTheme.yellow, size: iconSize),
          Text(rating.toString(), style: style.copyWith(color: useStarTextColor ? colorTheme.yellow : colorTheme.textBlack),)
        ],
      ),
    );
  }
}
