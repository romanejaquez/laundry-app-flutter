import 'package:laundry_app/models/garment.dart';

class SelectedGarmentOption {

  bool isSelected;
  Garment garment;

  SelectedGarmentOption({
    required this.isSelected,
    required this.garment
  });
}