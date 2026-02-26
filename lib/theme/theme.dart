import 'package:dorimol/theme/app_colors.dart';
import 'package:dorimol/theme/app_text.dart';
import 'package:flutter/material.dart';

const seedColor = Color(0xFF00b956);
const backgroundColor = Color(0xFFFCFCFC);
const textBlackColor = Color(0xFF2B2B2B);
const textGrayColor = Color(0xFF303030);
const iconGrayColor = Color(0xFF525252);
const blockColor = Color(0xFFEEEEEE);
const tipsColor = Color(0xFFBDBDBD);
const blueColor = Color(0xFF5992E8);
const redColor = Color(0xFFFF0032);
const yellowColor = Color(0xFFFFC300);
const accintColor = Color(0xFFA7DDBC);
const formInputColor = Color(0xFFF7F7F7);
const stripeColor = Color(0xFFDEDEDE);
const exyBlueColor = Color(0xFF2297F6);
const popBlueColor = Color(0xFF2979FF);
const youBlueColor = Color(0xFF3D5AFE);
const skyBlueColor = Color(0xFF7CC3FC);
const electricGreenColor = Color(0xFF16B31B);
const lopyGreenColor = Color(0xFF00D06B);
const dirtyGreenColor = Color(0xFF319134);
const freeGreenColor = Color(0xFF77DA7A);
const tomatoRedColor = Color(0xFFFF1744);
const mlineRedColor = Color(0xFFF50057);
const rasberyRedColor = Color(0xFFC3134F);
const punchRedColor = Color(0xFFEF9A9A);


final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
  scaffoldBackgroundColor: const Color(0xFFF9F9F9),
  fontFamily: "Rostelecom",
  iconTheme: const IconThemeData(
    color: iconGrayColor
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      backgroundColor: blockColor,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      minimumSize: Size.zero,
      padding: EdgeInsets.zero,
    )
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      iconColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
      minimumSize: Size.zero,
    )
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 18),
    enabledBorder: InputBorder.none,
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    hintStyle: AppText.t3.copyWith(color: tipsColor),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: seedColor,
  ),
  dialogTheme: const DialogThemeData(
    backgroundColor: backgroundColor
  ),
  extensions: <ThemeExtension<dynamic>>[
    const AppColors(
      seedColor: seedColor,
      textBlack: textBlackColor,
      textGray: textGrayColor,
      iconGray: iconGrayColor,
      tips: tipsColor,
      blue: blueColor,
      red: redColor,
      yellow: yellowColor,
      accint: accintColor,
      background: backgroundColor,
      block: blockColor, 
      formInput: formInputColor,
      stripe: stripeColor,
      exyBlue: exyBlueColor,
      popBlue: popBlueColor,
      youBlue: youBlueColor,
      skyBlue: skyBlueColor,
      electricGreen: electricGreenColor,
      lopyGreen: lopyGreenColor,
      dirtyGreen: dirtyGreenColor,
      freeGreen: freeGreenColor,
      tomatoRed: tomatoRedColor,
      mlineRed: mlineRedColor,
      rasberyRed: rasberyRedColor,
      punchRed: punchRedColor,
    )
  ]
);