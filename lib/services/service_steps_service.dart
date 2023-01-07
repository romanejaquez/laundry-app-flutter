import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/utils.dart';
import 'package:laundry_app/models/service_step.dart';
import 'package:laundry_app/services/base_service.dart';

class ServiceStepsService extends ChangeNotifier {

  BaseService? baseService;
  List<ServiceStep> steps = [];
  ServiceStep? currentStep;
  
  ServiceStepsService() {
    steps = Utils.getServiceSteps();
    currentStep = steps.first;
  }

  void setBaseService(BaseService s) {
    baseService = s;
    baseService!.notifyBaseListeners(() {
      notifyListeners();
    });
  }

  void moveToNextStep() {
    currentStep!.isComplete = true;
    currentStep = steps[currentStep!.stepIndex + 1];
    notifyListeners();
  }

  bool canGoToNextStep() {
    return currentStep!.stepIndex < steps.length - 1;
  }

  void goBackToPreviousStep() {
    currentStep!.isComplete = false;
    currentStep = steps[currentStep!.stepIndex - 1];
    notifyListeners();
  }

  void resetAll() {
    baseService!.resetAll();
    notifyListeners();
  }

  bool selectionsMade() {
    return baseService!.selectionsMade();
  }
}