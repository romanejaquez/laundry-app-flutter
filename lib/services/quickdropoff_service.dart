import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/utils.dart';
import 'package:laundry_app/models/quick_dropoff_order_item.dart';
import 'package:laundry_app/models/selected_service_option.dart';

class QuickDropoffService extends ChangeNotifier {

  static const maxAmount = 6;

  List<QuickDropoffOrderItem> orderItems = [];

  QuickDropoffService() {
    orderItems = Utils.getDefaultQuickDropoffOrderItems();
  }

  void incrementAmount(String orderId) {
    QuickDropoffOrderItem item = orderItems.where((o) => o.id == orderId).first;
    item.amount++;
    
    if (item.amount > maxAmount) {
      item.amount = 0;
      item.options.forEach((element) { element.isSelected = false; });
    }

    notifyListeners();
  }

  void selectServiceOption(String id, SelectedServiceOption currentOption) {
    QuickDropoffOrderItem item = orderItems.where((o) => o.id == id).first;
    SelectedServiceOption option = item.options.where((o) => o == currentOption).first;
    option.isSelected = !option.isSelected;

    notifyListeners();
  }
}