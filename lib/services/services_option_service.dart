import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/utils.dart';
import 'package:laundry_app/models/selected_service_option.dart';
import 'package:laundry_app/models/service_option.dart';
import 'package:laundry_app/services/base_service.dart';

class ServicesOptionService extends ChangeNotifier implements BaseService {

  List<SelectedServiceOption> options = [];
  ServiceOption? option;
  Function? callback;
  
  ServicesOptionService() {
    options = Utils.getServicesOptions().map((e) {
      return SelectedServiceOption(
        isSelected: false,
        service: e
      );
    }).toList();

    option = options.first.service;
  }

  @override
  void resetAll() {
    options.forEach((element) {
      element.isSelected = false;
    });

    option = null;
    notifyListeners();
  }

  void selectService(SelectedServiceOption o) {
    var currentOption = options.where((e) => e == o).first;
    currentOption.isSelected = !currentOption.isSelected;
    option = o.service;
    notifyListeners();
    callback!();
  }
  
  @override
  bool selectionsMade() {
    return options.any((o) => o.isSelected);
  }
  
  @override
  void notifyBaseListeners(Function cb) {
    callback = cb;
  }
}