import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/utils.dart';
import 'package:laundry_app/models/order_model.dart';
import 'package:laundry_app/pages/mobile/qrscan_mobilebadge.dart';

class QRScanDataService {

  void decodeScannedValue(Map<String, dynamic> decodedValue, Function onDecodingComplete) {
    if (decodedValue.keys.contains('orderId')) {

      var decodedOrder = OrderModel.fromJson(decodedValue, '');

      // debugPrint('Scan Data: ' + scanData.code.toString());
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: Utils.rootNavigatorKey.currentContext!,
        builder: (ctx) {
          return QRScanMobileBadge(
            order: decodedOrder
          );
        },
      ).whenComplete(() {
        onDecodingComplete();
      });
    }
  }
}