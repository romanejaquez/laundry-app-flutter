import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:laundry_app/models/order_model.dart';

class OrderReceivedNotificationService extends ChangeNotifier {

  OrderModel? receivedOrder;

  OrderReceivedNotificationService() {
    setupListeners();
  }

  bool orderReceived = false;

  void notifyOrderReceived() {
    orderReceived = true;
    notifyListeners();
  }

  void resetOrder() {
    receivedOrder = null;
  }

  void hideOrderReceivedPanel() {
    orderReceived = false;
    notifyListeners();
  }

  void setupListeners() {
    FirebaseFirestore.instance.collection('orders').orderBy('created', descending: true).snapshots().listen(
      (QuerySnapshot snapshot) {
        if (snapshot.docs.isEmpty) {
          return;
        }
        
        var latestOrder = snapshot.docs.first;
        var orderData = latestOrder.data() as Map<String, dynamic>;
        receivedOrder = OrderModel.fromJson(orderData, latestOrder.id);
        notifyListeners();
        notifyOrderReceived();
    });
  }
}