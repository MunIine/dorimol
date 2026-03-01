import 'package:flutter/material.dart';

class CartContentBlock extends StatelessWidget {
  const CartContentBlock({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFFFFFFF)
      ),
      child: child
    );
  }
}