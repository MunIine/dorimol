import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

class ReturnButton extends StatelessWidget {
  const ReturnButton({
    super.key, this.size, 
  });

  final double? size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).pop(),
      style: IconButton.styleFrom(
        backgroundColor: Colors.transparent
      ),
      icon: Transform.rotate(
        angle: 3.14159,
        child: Icon(SvgIcons.back, size: size,)
      )
    );
  }
}