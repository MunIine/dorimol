import 'package:flutter/material.dart';

const brandColor = Color(0xFF00b956);
const brand20Color = Color(0xFFCCF1DD);
const backgroundColor = Color(0xFFFCFCFC);
const textBlackColor = Color(0xFF2B2B2B);
const textGreyColor = Color(0xFF303030);
const iconGreyColor = Color(0xFF525252);
const blockColor = Color(0xFFEEEEEE);
const tipsColor = Color(0xFFBDBDBD);


final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: brandColor),
  scaffoldBackgroundColor: backgroundColor,
  fontFamily: "Rostelecom",
  iconTheme: IconThemeData(
    color: iconGreyColor
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      backgroundColor: blockColor,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      minimumSize: Size.zero,
      padding: EdgeInsets.zero,
    )
  ),
);