import 'package:flutter/material.dart';
import 'package:laundry_app/services/base_service.dart';

class ServiceStep {

  int stepIndex;
  bool isComplete;
  Widget stepView;
  BaseService service;


  ServiceStep({
    required this.stepIndex,
    required this.isComplete,
    required this.stepView,
    required this.service
  });
}