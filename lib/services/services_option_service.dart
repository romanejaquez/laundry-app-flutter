import 'package:laundry_app/helpers/utils.dart';
import 'package:laundry_app/models/service_option.dart';

class ServicesOptionService {

  List<ServiceOption> options = [];
  
  ServicesOptionService() {
    options = Utils.getServicesOptions();
  }
}