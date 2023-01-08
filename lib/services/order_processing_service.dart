import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laundry_app/models/order_model.dart';

class OrderProcessingService {

  void onOrderScanned({ required OrderModel order,
    required Function onOrderSent,
    required Function onError  
  }) {
    FirebaseFirestore.instance.collection('orders').add(
      order.toJson()
    ).whenComplete(() {
      onOrderSent();
    }).onError((error, stackTrace) => onError());
  }
}