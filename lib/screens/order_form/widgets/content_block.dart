import 'package:flutter/material.dart';

class OrderContentBlock extends StatelessWidget {
  const OrderContentBlock({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFFFFFFFF)
      ),
      child: child
    );
  }
}