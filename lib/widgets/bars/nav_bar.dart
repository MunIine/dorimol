import 'package:auto_route/auto_route.dart';
import 'package:dorimol/router/router.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    super.key,
    required this.colorTheme,
    required this.tabsRouter,
    required this.icons,
  });

  final AppColors colorTheme;
  final TabsRouter tabsRouter;
  final List<IconData> icons;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    final activeIndex = widget.tabsRouter.activeIndex;

    final count = widget.icons.length;
    final iconSize = 56.0;
    final totalWidth = iconSize * count;
    
    return Positioned(
      left: 0,
      right: 0,
      bottom: 35,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: widget.colorTheme.seedColor,
            borderRadius: BorderRadius.circular(50),
          ),
          // padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: SizedBox(
            width: totalWidth,
            height: iconSize,
            child: Stack(
              children: [
                AnimatedPositioned(
                  top: 0,
                  left: iconSize * activeIndex,
                  duration: Duration(milliseconds: 250),
                  curve: Curves.ease,
                  child: Container(
                    width: iconSize,
                    height: iconSize,
                    decoration: BoxDecoration(
                      color: Color(0xFF03CA60),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(count, (index) {
                    return SizedBox(
                      width: iconSize,
                      height: iconSize,
                      child: IconButton(
                        onPressed: () {
                          // If cart push to screen
                          if (index == 2) {
                            AutoRouter.of(context).root.push(OrderRoute());
                            return;
                          }
                          widget.tabsRouter.setActiveIndex(index);
                        },
                        icon: Icon(
                          widget.icons[index],
                          color: widget.colorTheme.background,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Color(0xFF01b554)
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}