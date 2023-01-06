import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/enums.dart';

class Garment {

  IconData icon;
  String label;
  String description;
  GarmentOptions option;

  Garment({
    required this.icon,
    required this.label,
    required this.description,
    required this.option
  });
}