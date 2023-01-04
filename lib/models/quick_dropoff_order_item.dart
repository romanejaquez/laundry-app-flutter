import 'package:laundry_app/models/garment.dart';
import 'package:laundry_app/models/selected_service_option.dart';
import 'package:laundry_app/models/service_option.dart';

class QuickDropoffOrderItem {

  String id;
  Garment garment;
  int amount;
  List<SelectedServiceOption> options;

  QuickDropoffOrderItem({
    required this.id,
    required this.garment,
    required this.amount,
    required this.options
  });
}