import 'package:flutter/material.dart';

class ServiceStep {

  int stepIndex;
  bool isComplete;
  Widget stepView;

  ServiceStep({
    required this.stepIndex,
    required this.isComplete,
    required this.stepView
  });
}