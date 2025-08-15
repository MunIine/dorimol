import 'package:dorimol/api/models/product_feedback.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

class ProductFeedbackWidget extends StatelessWidget {
  const ProductFeedbackWidget({
    super.key,
    required this.colorTheme, 
    required this.padding, 
    required this.feedbacks,
  });

  final AppColors colorTheme;
  final EdgeInsets padding;
  final List<ProductFeedback> feedbacks;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding,
          child: Row(
            children: [
              Text("Отзывы", style: AppText.t5.copyWith(color: colorTheme.textBlack)),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(SvgIcons.back),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 65,
          child: ListView.separated(
            itemCount: feedbacks.length,
            scrollDirection: Axis.horizontal,
            padding: padding,
            separatorBuilder: (context, index) => const SizedBox(width: 10), 
            itemBuilder: (context, index) => SizedBox(
              height: 65,
              width: 275, 
              child: _FeedbackCard(
                colorTheme: colorTheme, 
                feedback: feedbacks[index]
              )
            ), 
          ),
        ),
      ],
    );
  }
}

class _FeedbackCard extends StatelessWidget {
  const _FeedbackCard({required this.colorTheme, required this.feedback});

  final AppColors colorTheme;
  final ProductFeedback feedback;

  @override
  Widget build(BuildContext context) {
    const List<String> monthNames = [
      'января',
      'февраля',
      'марта',
      'апреля',
      'мая',
      'июня',
      'июля',
      'августа',
      'сентября',
      'октября',
      'ноября',
      'декабря',
    ];

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colorTheme.background,
        border: Border.all(color: const Color(0xFFDEDEDE), width: 0.5),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red.shade300,
                borderRadius: BorderRadius.circular(12)
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(feedback.rating, (index) => Icon(Icons.star_rounded, size: 12, color: colorTheme.yellow)),
                    ),
                    Text("${feedback.createdAt.day} ${monthNames[feedback.createdAt.month-1]} ${feedback.createdAt.year}", 
                      style: AppText.t0.copyWith(color: colorTheme.iconGray)
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    feedback.comment, 
                    style: AppText.t0.copyWith(color: colorTheme.textBlack, height: 1.1),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}