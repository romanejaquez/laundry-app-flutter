import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/helpers/laundry_header_actions.dart';
import 'package:laundry_app/helpers/laundry_icons_icons.dart';
import 'package:laundry_app/helpers/services_options.dart';
import 'package:laundry_app/models/laundry_header_option.dart';
import 'package:laundry_app/models/laundry_left_nav_tab.dart';
import 'package:laundry_app/models/service_option.dart';

class Utils {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final mainPageNavigatorKey = GlobalKey<NavigatorState>();

  static List<LaundryLeftNavTab> getDefaultLeftNavTabs() {
    return [
      LaundryLeftNavTab(
        label: 'Services',
        isSelected: true, 
        route: '/services'
      ),
      LaundryLeftNavTab(
        label: 'Orders',
        isSelected: false, 
        route: '/orders'
      ),
      LaundryLeftNavTab(
        label: 'Settings',
        isSelected: false, 
        route: '/settings'
      )
    ];
  }

  static List<LaundryHeaderOption> headerOptions() {
    return [
      LaundryHeaderOption(
        icon: Icons.arrow_back,
        action: LaundryHeaderActions.back,
        bgColor: LaundryAppColors.blue3,
        iconColor: LaundryAppColors.darkBlue
      ),
      LaundryHeaderOption(
        icon: Icons.wifi,
        action: LaundryHeaderActions.wifi,
        bgColor: LaundryAppColors.blue2,
        iconColor: Colors.white
      ),
      LaundryHeaderOption(
        icon: Icons.settings,
        action: LaundryHeaderActions.settings,
        bgColor: LaundryAppColors.blue1,
        iconColor: Colors.white
      ),
      LaundryHeaderOption(
        icon: Icons.logout,
        action: LaundryHeaderActions.exit,
        bgColor: LaundryAppColors.darkBlue,
        iconColor: Colors.white
      )
    ];
  }

  static List<ServiceOption> getServicesOptions() {
    return [
      ServiceOption(
        label: 'Wash/Dry',
        icon: LaundryIcons.laundry,
        option: ServicesOptions.washDry
      ),
      ServiceOption(
        label: 'Press',
        icon: LaundryIcons.iron,
        option: ServicesOptions.press
      ),
      ServiceOption(
        label: 'Steam',
        icon: LaundryIcons.steam,
        option: ServicesOptions.steam
      ),
      ServiceOption(
        label: 'Alterations',
        icon: LaundryIcons.alteration,
        option: ServicesOptions.alterations
      ),
      ServiceOption(
        label: 'Other',
        icon: Icons.more_horiz,
        option: ServicesOptions.other
      )
    ];
  }
}