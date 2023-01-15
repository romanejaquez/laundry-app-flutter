import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/context_mixin.dart';
import 'package:laundry_app/models/garment.dart';
import 'package:laundry_app/models/garment_orderitem.dart';
import 'package:laundry_app/models/selected_service_option.dart';
import 'package:laundry_app/models/service_option.dart';
import 'package:laundry_app/services/base_service.dart';
import 'package:laundry_app/services/garment_options_service.dart';
import 'package:laundry_app/services/services_option_service.dart';
import 'package:provider/provider.dart';

class AmountGarmentServicesSelection extends ChangeNotifier with BaseContext implements BaseService {

  List<GarmentOrderItem> orderItems = [];

  void generateSelectedOptions() {
    
    GarmentOptionsService garmentOptionsService = context.read<GarmentOptionsService>();
    ServicesOptionService servicesOptionService = context.read<ServicesOptionService>();

    // grab only the selected garments
    List<Garment> garments = garmentOptionsService.garments.where((gs) => 
      gs.isSelected).map((g) => g.garment).toList();

    List<ServiceOption> serviceOptions = servicesOptionService.options.where((so) => 
      so.isSelected).map((g) => g.service).toList();

    orderItems = garments.map((g) => GarmentOrderItem(
      id: g.icon.codePoint.toString(),
      garment: g,
      amount: 0,
      options: serviceOptions.map((s) => SelectedServiceOption(
          isSelected: false, service: s)).toList()
        )
      ).toList();
  }
  
  @override
  Function? callback;
  
  @override
  void notifyBaseListeners(Function callback) {
    // TODO: implement notifyBaseListeners
  }
  
  @override
  void resetAll() {
    // TODO: implement resetAll
  }
  
  @override
  bool selectionsMade() {
    // TODO: implement selectionsMade
    throw UnimplementedError();
  }
}