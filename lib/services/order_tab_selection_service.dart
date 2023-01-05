import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/utils.dart';
import 'package:laundry_app/models/order_tab.dart';

class OrderTabSelectionService extends ChangeNotifier {

  List<OrderTab> orderTabs = [];

  OrderTabSelectionService() {
    orderTabs = Utils.getDefaultOrderTabs();
  }

  void selectTab(OrderTab orderTab) {
    for (var element in orderTabs) {
      element.isSelected = element == orderTab;
    }

    notifyListeners();
  }
}