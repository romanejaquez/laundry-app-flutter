import 'package:laundry_app/models/service_option.dart';

class SelectedServiceOption {

  bool isSelected;
  ServiceOption service;

  SelectedServiceOption({
    required this.isSelected,
    required this.service
  });
}