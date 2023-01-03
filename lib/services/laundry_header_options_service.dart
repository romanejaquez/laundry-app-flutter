import 'package:laundry_app/helpers/utils.dart';
import 'package:laundry_app/models/laundry_header_option.dart';

class LaundryHeaderOptionsService {

  List<LaundryHeaderOption> allOptions = [];

  LaundryHeaderOptionsService() {
    allOptions = Utils.headerOptions();
  }

  void selectOption(LaundryHeaderOption o) {
    // do something
  }
}