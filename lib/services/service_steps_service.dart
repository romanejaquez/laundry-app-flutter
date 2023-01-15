import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/context_mixin.dart';
import 'package:laundry_app/helpers/utils.dart';
import 'package:laundry_app/models/service_step.dart';
import 'package:laundry_app/services/base_service.dart';

class ServiceStepsService extends ChangeNotifier with BaseContext {

  BaseService? baseService;
  List<ServiceStep> steps = [];
  ServiceStep? currentStep;
  PageController? pageController;


  @override
  void setContext(BuildContext c) {
    context = c;
    steps = Utils.getServiceSteps(context);
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

  void startOver() {
    
    steps.forEach((element) {
      element.isComplete = false;
      element.service.resetAll();
    });

    pageController!.jumpToPage(0);
    currentStep = steps.first;
    notifyListeners();
  }
}