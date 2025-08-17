import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:dorimol/theme/export.dart';

@RoutePage()
class OnboardingFirstScreen extends StatefulWidget {
  const OnboardingFirstScreen({
    super.key,
    required this.colorTheme,
  });

  final AppColors colorTheme;

  @override
  State<OnboardingFirstScreen> createState() => _OnboardingFirstScreenState();
}

class _OnboardingFirstScreenState extends State<OnboardingFirstScreen> {
  final controller = TextEditingController();
  bool enabled = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    if ((controller.text.trim().isNotEmpty && !enabled) || (controller.text.trim().isEmpty && enabled)) {
      setState(() {
        enabled = !enabled;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text("Введите имя", style: AppText.h1alt.copyWith(color: widget.colorTheme.textBlack)),
          Text(
            "Введите имя, которое мы будем использовать в заказах и уведомлениях. Это поможет нам сделать обслуживание более персональным.",
            textAlign: TextAlign.center,
            style: AppText.t7.copyWith(color: widget.colorTheme.textBlack)
          ),
          SizedBox(height: 30),
          Align(alignment: Alignment.centerLeft, child: Text("Ваше имя", style: AppText.b1.copyWith(color: widget.colorTheme.iconGray))),
          SizedBox(height: 4),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: widget.colorTheme.formInput,
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Донжуан",
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: enabled ? () => AutoTabsRouter.of(context).setActiveIndex(1) : null,
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
                backgroundColor: widget.colorTheme.seedColor,
                disabledBackgroundColor: widget.colorTheme.tips,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text("Далее", style: AppText.b7.copyWith(color: widget.colorTheme.background))
            ),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}
