import 'package:laundry_app/models/garment.dart';
import 'package:laundry_app/models/selected_service_option.dart';

class GarmentOrderItem {

  String id;
  Garment garment;
  int amount;
  List<SelectedServiceOption> options;

  GarmentOrderItem({
    required this.id,
    required this.garment,
    required this.amount,
    required this.options
  });
}