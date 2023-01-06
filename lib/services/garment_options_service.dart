import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/utils.dart';
import 'package:laundry_app/models/garment.dart';

class GarmentOptionsService extends ChangeNotifier {

  List<Garment> garments = [];
  
  GarmentOptionsService() {
    garments = Utils.getDefaultGarments();
  }
}