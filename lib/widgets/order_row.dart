import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:laundry_app/models/order_model.dart';

class OrderRow extends StatelessWidget {

  final OrderModel order;
  const OrderRow({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: LaundryAppColors.mainBlue.withOpacity(0.25),
        borderRadius: BorderRadius.circular(LaundryStyles.largeBorderRadius)
      ),
      padding: const EdgeInsets.all(LaundryStyles.largePadding),
      child: Row(
        children: [
          Text(order.orderId, style: LaundryStyles.mediumBoldBlueTextStyle)
        ],
      )
    );
  }
}