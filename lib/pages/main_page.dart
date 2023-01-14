import 'package:flutter/material.dart';
import 'package:laundry_app/pages/orders/order_received_notification_wrapper.dart';
import 'package:laundry_app/services/side_panel_service.dart';
import 'package:laundry_app/widgets/laundry_header.dart';
import 'package:laundry_app/widgets/laundry_left_nav.dart';

class MainPage extends StatelessWidget {
  final Widget child;
  const MainPage({super.key, required this.child });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Row(
            children: [
              const LaundryLeftNav(),
              Expanded(
                child: Column(
                  children: [
                    const LaundryHeader(),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: child,
                          ),
                        ],
                      )
                    )
                  ],
                ),
              )
            ],
          ),
          const OrderReceivedNotificationWrapper()
        ],
      )
    );
  }
}