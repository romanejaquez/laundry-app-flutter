import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';

class LaundryStyles {

  static const double defaultIconSize = 60;
  static const double lgIconSize = 80;
  static const double xlgIconSize = 100;

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
    fontSize: 40, 
    fontWeight: FontWeight.normal, 
    color: LaundryAppColors.darkBlue
  );

  static const TextStyle mediumBoldBlueTextStyle = TextStyle(
    fontSize: 40, 
    fontWeight: FontWeight.bold, 
    color: LaundryAppColors.darkBlue
  );

  static const TextStyle largeNormalBlueTextStyle = TextStyle(
    fontSize: 40, 
    fontWeight: FontWeight.normal, 
    color: LaundryAppColors.darkBlue
  );

  static const TextStyle largeBoldBlueTextStyle = TextStyle(
    fontSize: 60, 
    fontWeight: FontWeight.bold, 
    color: LaundryAppColors.darkBlue
  );

  static const TextStyle xLargeBoldBlueTextStyle = TextStyle(
    fontSize: 80, 
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

  static const TextStyle header3TitleStyle = TextStyle(
    fontSize: 30, 
    fontWeight: FontWeight.normal, 
    color: LaundryAppColors.darkBlue
  );

  static const TextStyle serviceOptionTileLabelNormal = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.bold, 
    color: LaundryAppColors.darkBlue
  );

  static const TextStyle serviceOptionTileLabelPressed = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.bold, 
    color: Colors.white
  );
}