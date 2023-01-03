import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_header_actions.dart';

class LaundryHeaderOption {

  IconData icon;
  LaundryHeaderActions action;
  Color bgColor;
  Color iconColor;

  LaundryHeaderOption({
    required this.icon,
    required this.action,
    required this.bgColor,
    required this.iconColor
  });
}