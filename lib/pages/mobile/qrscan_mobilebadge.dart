import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:laundry_app/helpers/utils.dart';
import 'package:laundry_app/models/order_model.dart';
import 'package:laundry_app/services/order_processing_service.dart';
import 'package:provider/provider.dart';

class QRScanMobileBadge extends StatelessWidget {

  final OrderModel order;
  const QRScanMobileBadge({
    super.key,
    required this.order
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(Icons.qr_code, color: LaundryAppColors.darkBlue, size: 80),
              const SizedBox(width: 20),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Order Id', style: LaundryStyles.normalBlueTextStyle),
                  Text('#${order.orderId}', style: LaundryStyles.mediumBoldBlueTextStyle),
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: LaundryAppColors.mainBlue,
              shape: const StadiumBorder(),
              elevation: 0,
              shadowColor: Colors.transparent
            ),
            onPressed: () {
              context.read<OrderProcessingService>().onOrderScanned(
                order: order,
                onOrderSent: () {
                  GoRouter.of(Utils.rootNavigatorKey.currentContext!).pop();
                },
                onError: () {
                  GoRouter.of(Utils.rootNavigatorKey.currentContext!).pop();
                }
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.send, size: 30),
                  SizedBox(width: 40),
                  Text('Send to POS',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 20)
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