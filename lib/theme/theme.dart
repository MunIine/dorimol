import 'package:dorimol/theme/app_colors.dart';
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


final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
  scaffoldBackgroundColor: backgroundColor,
  fontFamily: "Rostelecom",
  iconTheme: IconThemeData(
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
  extensions: <ThemeExtension<dynamic>>[
    AppColors(
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
      block: blockColor
    )
  ]
);