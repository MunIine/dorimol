import 'package:auto_route/auto_route.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
    required this.tabsRouter, 
    required this.colorTheme, 
    required this.onTap,
    required this.enabled,
    required this.text
  });

  final TabsRouter tabsRouter;
  final AppColors colorTheme;
  final VoidCallback onTap;
  final bool enabled;
  final Widget text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 35),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: (){
                  if (tabsRouter.activeIndex != 0){
                    tabsRouter.setActiveIndex(tabsRouter.activeIndex-1);
                    return;
                  }
                  AutoRouter.of(context).pop();
                },
                style: IconButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: colorTheme.seedColor,
                ),
                icon: Transform.rotate(
                  angle: 3.14159,
                  child: Icon(SvgIcons.back, color: colorTheme.background)
                )
              ),
              const SizedBox(width: 8),
              Expanded(
                child: GestureDetector(
                  onTap: enabled ? onTap : null,
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: enabled ? colorTheme.seedColor : colorTheme.tips
                    ),
                    child: text
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}