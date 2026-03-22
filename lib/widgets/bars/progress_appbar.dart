import 'package:auto_route/auto_route.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

class ProgressAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProgressAppBar({
    super.key,
    required this.tabsRouter,
    required this.activeColor,
  });

  final TabsRouter tabsRouter;
  final Color activeColor;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final inactiveColor = Theme.of(context).extension<AppColors>()!.stripe;

    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      title: Row(
        children: List.generate(tabsRouter.pageCount, (index) {
          return Expanded(
            child: Container(
              margin: EdgeInsets.only(right: index < tabsRouter.pageCount - 1 ? 8 : 0),
              height: 4,
              decoration: BoxDecoration(
                color: index <= tabsRouter.activeIndex ? activeColor : inactiveColor,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        }),
      ),
    );
  }
}