import 'package:dorimol/data/app_config.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/helpers/rating_block.dart';
import 'package:dorimol/widgets/helpers/return_button.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.imageUrl,
    this.rating,
    required this.colorTheme,
  });

  final AppColors colorTheme;
  final String imageUrl;
  final double? rating;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 280 + 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                Uri.parse(AppConfig.apiUrl).resolve(imageUrl).toString(),
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (rating != null)
          Positioned(
            left: 20,
            top: 259 + 50,
            child: RatingBlock(
              rating: rating!,
              padding: const EdgeInsets.only(
                left: 8,
              ).copyWith(right: 10).copyWith(top: 2),
              useStarTextColor: true,
              style: AppText.t5,
              iconSize: 14,
              borderRadius: 8,
            ),
          ),
        Positioned(
          left: 16,
          top: 4 + 36,
          child: ReturnButton(color: colorTheme.tips, size: 28),
        ),
      ],
    );
  }
}
