import 'package:dorimol/models/order_statuses.dart';
import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.seedColor,
    required this.textBlack,
    required this.textGray,
    required this.iconGray,
    required this.tips,
    required this.blue,
    required this.red,
    required this.yellow,
    required this.accint,
    required this.background,
    required this.block,
    required this.formInput,
    required this.stripe,
    required this.exyBlue,
    required this.lopyGreen,
    required this.mlineRed,
  });

  final Color seedColor;
  final Color textBlack;
  final Color textGray;
  final Color iconGray;
  final Color tips;
  final Color blue;
  final Color red;
  final Color yellow;
  final Color accint;
  final Color background;
  final Color block;
  final Color formInput;
  final Color stripe;
  final Color exyBlue;
  final Color lopyGreen;
  final Color mlineRed;

  @override
  AppColors copyWith({
  Color? seedColor,
  Color? textBlack,
  Color? textGray,
  Color? iconGray,
  Color? tips,
  Color? blue,
  Color? red,
  Color? yellow,
  Color? accint,
  Color? background,
  Color? block,
  Color? formInput,
  Color? stripe,
  Color? exyBlue,
  Color? lopyGreen,
  Color? mlineRed,
  }) {
    return AppColors(
      seedColor: seedColor ?? this.seedColor,
      textBlack: textBlack ?? this.textBlack,
      textGray: textGray ?? this.textGray,
      iconGray: iconGray ?? this.iconGray,
      tips: tips ?? this.tips,
      blue: blue ?? this.blue,
      red: red ?? this.red,
      yellow: yellow ?? this.yellow,
      accint: accint ?? this.accint,
      background: background ?? this.background,
      block: block ?? this.block,
      formInput: formInput ?? this.formInput,
      stripe: stripe ?? this.stripe,
      exyBlue: exyBlue ?? this.exyBlue,
      lopyGreen: lopyGreen ?? this.lopyGreen,
      mlineRed: mlineRed ?? this.mlineRed,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      seedColor: Color.lerp(seedColor, other.seedColor, t)!,
      textBlack: Color.lerp(textBlack, other.textBlack, t)!,
      textGray: Color.lerp(textGray, other.textGray, t)!,
      iconGray: Color.lerp(iconGray, other.iconGray, t)!,
      tips: Color.lerp(tips, other.tips, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      red: Color.lerp(red, other.red, t)!,
      yellow: Color.lerp(yellow, other.yellow, t)!,
      accint: Color.lerp(accint, other.accint, t)!,
      background: Color.lerp(background, other.background, t)!,
      block: Color.lerp(block, other.block, t)!,
      formInput: Color.lerp(formInput, other.formInput, t)!,
      stripe: Color.lerp(stripe, other.stripe, t)!,
      exyBlue: Color.lerp(exyBlue, other.exyBlue, t)!,
      lopyGreen: Color.lerp(lopyGreen, other.lopyGreen, t)!,
      mlineRed: Color.lerp(mlineRed, other.mlineRed, t)!,
    );
  }

  Color colorForOrderStatus(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return iconGray;
      case OrderStatus.confirmed:
        return exyBlue;
      case OrderStatus.shipped:
        return yellow;
      case OrderStatus.delivered:
        return lopyGreen;
      case OrderStatus.cancelled:
        return red;
      case OrderStatus.unknown:
        return iconGray;
    }
  }

  Color backgroundForOrderStatus(OrderStatus status) {
    return colorForOrderStatus(status).withAlpha(38);
  }

  Color colorForDiscountTier(int index) {
    final colors = [seedColor, exyBlue, mlineRed];
    if (index < 0 || index >= colors.length) return iconGray;
    return colors[index];
  }
}