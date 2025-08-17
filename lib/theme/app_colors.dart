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
    required this.popBlue,
    required this.youBlue,
    required this.skyBlue,
    required this.electricGreen,
    required this.lopyGreen,
    required this.dirtyGreen,
    required this.freeGreen,
    required this.tomatoRed,
    required this.mlineRed,
    required this.rasberyRed,
    required this.punchRed,
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
  final Color popBlue;
  final Color youBlue;
  final Color skyBlue;
  final Color electricGreen;
  final Color lopyGreen;
  final Color dirtyGreen;
  final Color freeGreen;
  final Color tomatoRed;
  final Color mlineRed;
  final Color rasberyRed;
  final Color punchRed;

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
  Color? popBlue,
  Color? youBlue,
  Color? skyBlue,
  Color? electricGreen,
  Color? lopyGreen,
  Color? dirtyGreen,
  Color? freeGreen,
  Color? tomatoRed,
  Color? mlineRed,
  Color? rasberyRed,
  Color? punchRed,
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
      popBlue: popBlue ?? this.popBlue,
      youBlue: youBlue ?? this.youBlue,
      skyBlue: skyBlue ?? this.skyBlue,
      electricGreen: electricGreen ?? this.electricGreen,
      lopyGreen: lopyGreen ?? this.lopyGreen,
      dirtyGreen: dirtyGreen ?? this.dirtyGreen,
      freeGreen: freeGreen ?? this.freeGreen,
      tomatoRed: tomatoRed ?? this.tomatoRed,
      mlineRed: mlineRed ?? this.mlineRed,
      rasberyRed: rasberyRed ?? this.rasberyRed,
      punchRed: punchRed ?? this.punchRed,
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
      popBlue: Color.lerp(popBlue, other.popBlue, t)!,
      youBlue: Color.lerp(youBlue, other.youBlue, t)!,
      skyBlue: Color.lerp(skyBlue, other.skyBlue, t)!,
      electricGreen: Color.lerp(electricGreen, other.electricGreen, t)!,
      lopyGreen: Color.lerp(lopyGreen, other.lopyGreen, t)!,
      dirtyGreen: Color.lerp(dirtyGreen, other.dirtyGreen, t)!,
      freeGreen: Color.lerp(freeGreen, other.freeGreen, t)!,
      tomatoRed: Color.lerp(tomatoRed, other.tomatoRed, t)!,
      mlineRed: Color.lerp(mlineRed, other.mlineRed, t)!,
      rasberyRed: Color.lerp(rasberyRed, other.rasberyRed, t)!,
      punchRed: Color.lerp(punchRed, other.punchRed, t)!,
    );
  }
}