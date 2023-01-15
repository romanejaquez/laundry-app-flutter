import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:laundry_app/helpers/context_mixin.dart';
import 'package:laundry_app/services/base_service.dart';

class OrderCompletionService extends ChangeNotifier with BaseContext implements BaseService {
  @override
  Function? callback;

  @override
  void notifyBaseListeners(Function callback) {
    // TODO: implement notifyBaseListeners
  }

  @override
  void resetAll() {
    // TODO: implement resetAll
  }

  @override
  bool selectionsMade() {
    // TODO: implement selectionsMade
    throw UnimplementedError();
  }

}