import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';

class LaundryStyles {

  static const double smallIconSize = 40;
  static const double mediumIconSize = 60;
  static const double lgIconSize = 80;
  static const double xlgIconSize = 100;

  static double smallPadding = 10;
  static double mediumPadding = 30;
  static double largePadding = 30;

  static double smallMargin = 5;
  static double mediumMargin = 10;
  static double largeMargin = 15;
  static double xLargeMargin = 15;

  static double smallGapSize = 10;
  static double mediumGapSize = 20;
  static double largeGapSize = 30;
  static double xLargeGapSize = 40;

  static double smallFontSize = 10;
  static double mediumFontSize = 30;
  static double largeFontSize = 60;

  static double smallBorderRadius = 10;
  static double mediumBorderRadius = 20;
  static double largeBorderRadius = 30;
  static double xLargeBorderRadius = 60;

  static const TextStyle leftNavTabNormalTextStyle = TextStyle(
    fontSize: 30, 
    fontWeight: FontWeight.bold, 
    color: LaundryAppColors.darkBlue
  );

  static const TextStyle leftNavTabSelectedTextStyle = TextStyle(
    fontSize: 30, 
    fontWeight: FontWeight.bold, 
    color: Colors.white
  );

  static const TextStyle normalBlueTextStyle = TextStyle(
    fontSize: 20, 
    fontWeight: FontWeight.normal, 
    color: LaundryAppColors.darkBlue
  );

  static const TextStyle mediumNormalBlueTextStyle = TextStyle(
    fontSize: 30, 
    fontWeight: FontWeight.normal, 
    color: LaundryAppColors.darkBlue
  );

  static const TextStyle mediumBoldBlueTextStyle = TextStyle(
    fontSize: 30, 
    fontWeight: FontWeight.bold, 
    color: LaundryAppColors.darkBlue
  );

  static const TextStyle largeNormalBlueTextStyle = TextStyle(
    fontSize: 40, 
    fontWeight: FontWeight.normal, 
    color: LaundryAppColors.darkBlue
  );

  static const TextStyle largeBoldBlueTextStyle = TextStyle(
    fontSize: 40, 
    fontWeight: FontWeight.bold, 
    color: LaundryAppColors.darkBlue
  );

  static const TextStyle xLargeNormalBlueTextStyle = TextStyle(
    fontSize: 60, 
    fontWeight: FontWeight.normal, 
    color: LaundryAppColors.darkBlue
  );

  static const TextStyle xLargeBoldBlueTextStyle = TextStyle(
    fontSize: 60, 
    fontWeight: FontWeight.bold, 
    color: LaundryAppColors.darkBlue
  );


  static const BoxDecoration selectedTabDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30),
      bottomLeft: Radius.circular(30)
    )
  );

  static const BoxDecoration normalTabDecoration = BoxDecoration(
    color: Color.fromARGB(128, 255, 255, 255),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30),
      bottomLeft: Radius.circular(30)
    )
  );

  static const TextStyle headerTitleStyle = TextStyle(
    fontSize: 30, 
    fontWeight: FontWeight.bold, 
    color: LaundryAppColors.mainBlue
  );

  static const TextStyle header1TitleStyle = TextStyle(
    fontSize: 60, 
    fontWeight: FontWeight.bold, 
    color: LaundryAppColors.darkBlue
  );

  static const TextStyle header2TitleStyle = TextStyle(
    fontSize: 50, 
    fontWeight: FontWeight.bold, 
    color: LaundryAppColors.darkBlue
  );

  static const TextStyle header3TitleStyle = TextStyle(
    fontSize: 40, 
    fontWeight: FontWeight.bold, 
    color: LaundryAppColors.darkBlue
  );

  static TextStyle serviceOptionTileLabelNormal = TextStyle(
    fontSize: mediumFontSize,
    fontWeight: FontWeight.bold, 
    color: LaundryAppColors.darkBlue
  );

  static TextStyle serviceOptionTileLabelPressed = TextStyle(
    fontSize: mediumFontSize,
    fontWeight: FontWeight.bold, 
    color: Colors.white
  );

}