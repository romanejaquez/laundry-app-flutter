import 'package:flutter/material.dart';

class LaundryThemeData {
  final Color mainBackground;
  final Color tab;
  final Color logo;
  final Color tabBackgroundNormal;
  final Color tabBackgroundSelected;
  final Color tabLabelNormal;
  final Color tabLabelSelected;

  LaundryThemeData({
    required this.mainBackground, 
    required this.tab, 
    required this.logo, 
    required this.tabBackgroundNormal, 
    required this.tabBackgroundSelected, 
    required this.tabLabelNormal,
    required this.tabLabelSelected 
  });
}

enum LaundryThemeOptions {
  light, dark
}