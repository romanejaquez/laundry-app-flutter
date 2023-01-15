import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/helpers/laundry_theme.dart';

class LaundryThemeService extends ChangeNotifier {

  late LaundryThemeData currentTheme;
  late LaundryThemeOptions option;

  LaundryThemeService() {
    option = LaundryThemeOptions.light;
    currentTheme = themes[LaundryThemeOptions.light]!;
  }

  Map<LaundryThemeOptions, LaundryThemeData> themes = {
    LaundryThemeOptions.light: LaundryThemeData(
      mainBackground: Colors.white,
      tab: LaundryAppColors.mainBlue,
      tabBackgroundNormal: const Color.fromARGB(128, 255, 255, 255),
      tabBackgroundSelected: Colors.white,
      logo: Colors.white,
      tabLabelNormal: Colors.white,
      tabLabelSelected: LaundryAppColors.darkBlue
    ),
    LaundryThemeOptions.dark: LaundryThemeData(
      mainBackground: Colors.black,
      tab: const Color.fromARGB(255, 68, 68, 68),
      tabBackgroundNormal: Colors.white.withOpacity(0.1),
      tabBackgroundSelected: Colors.black,
      logo: LaundryAppColors.mainBlue,
      tabLabelNormal: Colors.white,
      tabLabelSelected: LaundryAppColors.mainBlue
    )
  };

  void setTheme(LaundryThemeOptions themeOption) {
    option = themeOption;
    currentTheme = themes[themeOption]!;
    notifyListeners();
  }

  void toggleTheme() {
    option = option == LaundryThemeOptions.light ? LaundryThemeOptions.dark : LaundryThemeOptions.light;
    setTheme(option);
  }
}