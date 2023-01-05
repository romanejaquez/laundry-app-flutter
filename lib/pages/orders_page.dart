import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/pages/orders/order_tabs.dart';

class OrdersPage extends StatelessWidget {

  final Widget child;
  const OrdersPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      color: Colors.transparent,
      child: Column(
        children: [
          const OrderTabs(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: LaundryAppColors.lightGray,
                borderRadius: BorderRadius.circular(50)
              ),
              child: child
            ),
          )
        ],
      )
    );
  }
}