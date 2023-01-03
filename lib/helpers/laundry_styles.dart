import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';

class LaundryStyles {

  static const TextStyle leftNavTabNormalTextStyle = TextStyle(
    fontSize: 20, 
    fontWeight: FontWeight.bold, 
    color: LaundryAppColors.darkBlue
  );

  static const TextStyle leftNavTabSelectedTextStyle = TextStyle(
    fontSize: 20, 
    fontWeight: FontWeight.bold, 
    color: Colors.white
  );

  static const BoxDecoration selectedTabDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      bottomLeft: Radius.circular(20)
    )
  );

  static const BoxDecoration normalTabDecoration = BoxDecoration(
    color: Color.fromARGB(128, 255, 255, 255),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      bottomLeft: Radius.circular(20)
    )
  );

  static const TextStyle headerTitleStyle = TextStyle(
    fontSize: 20, 
    fontWeight: FontWeight.bold, 
    color: LaundryAppColors.mainBlue
  );

  static const TextStyle mainHeaderTitleStyle = TextStyle(
    fontSize: 50, 
    fontWeight: FontWeight.bold, 
    color: LaundryAppColors.darkBlue
  );

  static const TextStyle serviceOptionTileLabelNormal = TextStyle(
    fontSize: 20, 
    fontWeight: FontWeight.bold, 
    color: LaundryAppColors.darkBlue
  );

  static const TextStyle serviceOptionTileLabelPressed = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold, 
    color: Colors.white
  );
}