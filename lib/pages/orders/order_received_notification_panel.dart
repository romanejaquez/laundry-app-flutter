import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:laundry_app/models/order_model.dart';
import 'package:laundry_app/services/laundry_left_tab_nav_service.dart';
import 'package:laundry_app/services/order_received_notification_service.dart';
import 'package:provider/provider.dart';

class OrderReceivedNotificationPanel extends StatelessWidget {

  final OrderModel order;
  const OrderReceivedNotificationPanel({
    super.key,
    required this.order
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )
      ),
      child: Row(
        children: [
          const Icon(Icons.qr_code, color: LaundryAppColors.mainBlue, size: LaundryStyles.xlgIconSize),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Order Id', style: LaundryStyles.mediumNormalBlueTextStyle),
                Text('#${order.orderId}', style: LaundryStyles.xLargeBoldBlueTextStyle),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: LaundryAppColors.mainBlue,
              shape: const StadiumBorder(),
              elevation: 0,
              shadowColor: Colors.transparent
            ),
            onPressed: () {
              //context.read<OrderReceivedNotificationService>().resetOrder();
              GoRouter.of(context).pop();
              context.read<LaundryLeftTabNavService>().navigateToTab('/ordersearch');
              
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.search, size: 40),
                  SizedBox(width: 40),
                  Text('Search Order',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 40)
                  )
                ],
              ),
            )
          )
        ],
      )
    );
  }
}