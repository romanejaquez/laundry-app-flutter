import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/utils.dart';
import 'package:laundry_app/models/garment.dart';
import 'package:laundry_app/models/selected_garment_option.dart';
import 'package:laundry_app/services/base_service.dart';

class GarmentOptionsService extends ChangeNotifier implements BaseService {

  List<SelectedGarmentOption> garments = [];
  Garment? garment;
  Function? callback;
  
  GarmentOptionsService() {
    garments = Utils.getDefaultGarments().map((g) {
      return SelectedGarmentOption(
        isSelected: false, garment: g
      );
    }).toList();

    garment = garments.first.garment;
  }

  @override
  void resetAll() {
    garments.forEach((element) {
      element.isSelected = false;
    });

    garment = null;
    notifyListeners();
  }

  void selectGarment(SelectedGarmentOption o) {
    var currentGarment = garments.where((e) => e == o).first;
    currentGarment.isSelected = !currentGarment.isSelected;
    garment = o.garment;
    notifyListeners();
    callback!();
  }
  
  @override
  bool selectionsMade() {
    return garments.any((g) => g.isSelected);
  }
  
  @override
  void notifyBaseListeners(Function cb) {
    callback = cb;
  }
}