import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/utils.dart';
import 'package:laundry_app/models/service_step.dart';
import 'package:laundry_app/services/base_service.dart';

class ServiceStepsService extends ChangeNotifier {

  BaseService? baseService;
  List<ServiceStep> steps = [];
  ServiceStep? currentStep;
  PageController? pageController;
  
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

    pageController!.nextPage(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut
    ).whenComplete(() => notifyListeners());

    notifyListeners();
  }

  bool canGoToNextStep() {
    return currentStep!.stepIndex < steps.length - 1;
  }

  void goBackToPreviousStep() {
    currentStep!.isComplete = false;
    currentStep = steps[currentStep!.stepIndex - 1];

    pageController!.previousPage(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut
    ).whenComplete(() => notifyListeners());

    notifyListeners();
  }

  void resetAll() {
    baseService!.resetAll();
    notifyListeners();
  }

  bool selectionsMade() {
    return baseService != null ? baseService!.selectionsMade() : false;
  }

  void setPageController(PageController ctrl) {
    pageController = ctrl;
  }

  bool isLastStep() {
    return currentStep!.stepIndex == steps.length - 1;
  }
}