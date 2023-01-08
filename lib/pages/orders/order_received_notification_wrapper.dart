import 'package:flutter/material.dart';
import 'package:laundry_app/pages/orders/order_received_notification_panel.dart';
import 'package:laundry_app/services/order_received_notification_service.dart';
import 'package:provider/provider.dart';

class OrderReceivedNotificationWrapper extends StatelessWidget {
  const OrderReceivedNotificationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderReceivedNotificationService>(
      builder: (context, ornService, child) {
        return ornService.orderReceived ?

          Builder(builder: ((context) {
            Future.delayed(Duration.zero, () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                builder: (context) {
                  return OrderReceivedNotificationPanel(
                    order: ornService.receivedOrder
                  );
                }
              );
            });

            return const SizedBox.shrink();
          })) :
        const SizedBox.shrink();
      }
    );
  }
}