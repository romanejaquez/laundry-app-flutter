import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/helpers/laundry_header_actions.dart';
import 'package:laundry_app/helpers/laundry_icons_icons.dart';
import 'package:laundry_app/helpers/services_options.dart';
import 'package:laundry_app/models/garment.dart';
import 'package:laundry_app/models/laundry_header_option.dart';
import 'package:laundry_app/models/laundry_left_nav_tab.dart';
import 'package:laundry_app/models/quick_dropoff_order_item.dart';
import 'package:laundry_app/models/selected_service_option.dart';
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
        label: 'Quick Drop-Off',
        isSelected: false, 
        route: '/quickdropoff'
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

  static List<Garment> getDefaultGarments() {
    return [
      Garment(
        icon: LaundryIcons.camisole3,
        label: 'Tanktop',
        description: 'Tanktop'
      ),
      Garment(
        icon: LaundryIcons.tshirt,
        label: 'T-shirt',
        description: 'T-shirt'
      ),
      Garment(
        icon: LaundryIcons.poloshirt,
        label: 'Polo-shirt',
        description: 'Polo-shirt'
      ),
      Garment(
        icon: LaundryIcons.sock1,
        label: 'Socks',
        description: 'Socks'
      ),
      Garment(
        icon: LaundryIcons.cocktail_dress2,
        label: 'Cocktail Dress',
        description: 'Cocktail Dress'
      )
    ];
  }

  static List<QuickDropoffOrderItem> getDefaultQuickDropoffOrderItems() {
    return Utils.getDefaultGarments().map((e) {

      return QuickDropoffOrderItem(
        id: e.icon.codePoint.toString(),
        garment: e,
        amount: 0,
        options: Utils.getServicesOptions().map((s) {
          return SelectedServiceOption(
            isSelected: false,
            service: s
          );
        }).toList()
      );
    }).toList();
  }
}