import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/helpers/rating_block.dart';
import 'package:dorimol/widgets/helpers/return_button.dart';
import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 280+50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/items/item2.png"),
              fit: BoxFit.cover
            )
          ),
        ),
        Positioned(
          left: 20,
          top: 259+50,
          child: RatingBlock(
            padding: EdgeInsets.only(left: 8).copyWith(right: 10).copyWith(top: 2),
            useStarTextColor: true,
            style: AppText.t5,
            iconSize: 14, 
            borderRadius: 8,
          )
        ),
        Positioned(
          left: 16,
          top: 4+36,
          child: ReturnButton()
        )
      ],
    );
  }
}