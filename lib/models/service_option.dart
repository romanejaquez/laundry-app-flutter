import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/enums.dart';

class ServiceOption {
  String label;
  IconData icon;
  ServicesOptions option;

  ServiceOption({
    required this.label,
    required this.icon,
    required this.option
  });
}