import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_app/helpers/utils.dart';
import 'package:laundry_app/models/laundry_left_nav_tab.dart';

class LaundryLeftTabNavService extends ChangeNotifier {

  late LaundryLeftNavTab selectedTab;
  List<LaundryLeftNavTab> allTabs = [];

  LaundryLeftTabNavService() {
    allTabs = Utils.getDefaultLeftNavTabs();
    selectedTab = allTabs.first;
  }

  void selectTab(LaundryLeftNavTab tab) {
    for (var element in allTabs) {
      element.isSelected = tab.route == element.route;
    }
    GoRouter.of(Utils.mainPageNavigatorKey.currentContext!).go(tab.route);
    notifyListeners();
  }
}