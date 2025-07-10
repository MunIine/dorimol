import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

class ItemFeedback extends StatelessWidget {
  const ItemFeedback({
    super.key,
    required this.colorTheme, 
    required this.padding,
  });

  final AppColors colorTheme;
  final EdgeInsets padding;

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
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(SvgIcons.back),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
          height: 65,
          child: ListView.separated(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            padding: padding,
            separatorBuilder: (context, index) => SizedBox(width: 10), 
            itemBuilder: (context, index) => SizedBox(height: 65,width: 275, child: _FeedbackCard(colorTheme: colorTheme,)), 
          ),
        ),
      ],
    );
  }
}

class _FeedbackCard extends StatelessWidget {
  const _FeedbackCard({required this.colorTheme});

  final AppColors colorTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colorTheme.background,
        border: Border.all(color: Color(0xFFDEDEDE), width: 0.5),
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
          SizedBox(width: 8),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(5, (index) => Icon(Icons.star_rounded, size: 12, color: colorTheme.yellow)),
                    ),
                    Text("8 июля 2025", style: AppText.t0.copyWith(color: colorTheme.iconGray)),
                  ],
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    "Помидоры спелые, без повреждений, огурцы хрустящие, зелень пахнет, как с грядки.", 
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