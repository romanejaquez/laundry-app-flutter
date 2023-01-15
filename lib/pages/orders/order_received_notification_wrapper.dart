import 'dart:async';

import 'package:flutter/material.dart';
import 'package:laundry_app/pages/orders/order_received_notification_panel.dart';
import 'package:laundry_app/services/order_received_notification_service.dart';
import 'package:provider/provider.dart';

class OrderReceivedNotificationWrapper extends StatefulWidget {
  const OrderReceivedNotificationWrapper({super.key});

  @override
  State<OrderReceivedNotificationWrapper> createState() => _OrderReceivedNotificationWrapperState();
}

class _OrderReceivedNotificationWrapperState extends State<OrderReceivedNotificationWrapper> {
  
  Timer notificationTimer = Timer(Duration.zero, () {});

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    notificationTimer.cancel();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Consumer<OrderReceivedNotificationService>(
      builder: (context, ornService, child) {
        // return ornService.orderReceived ?

        //   Builder(builder: ((context) {
        //     notificationTimer = Timer(Duration.zero, () {
        //       showModalBottomSheet(
        //         context: context,
        //         backgroundColor: Colors.transparent,
        //         isScrollControlled: true,
        //         builder: (context) {
        //           return OrderReceivedNotificationPanel(
        //             order: ornService.receivedOrder!
        //           );
        //         }
        //       );
        //     });

        //     return const SizedBox.shrink();
        //   })) :
        return const SizedBox.shrink();
      }
    );
  }
}