import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:laundry_app/helpers/utils.dart';
import 'package:laundry_app/services/printing_service.dart';
import 'package:laundry_app/widgets/laundry_action_button.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReceiptViewToast extends StatelessWidget {
  const ReceiptViewToast({super.key});

  @override
  Widget build(BuildContext context) {

    var qrData = '{ "orderId": "XYZ123", "description": "some stuff", "created": "2022-12-12T05:06:00Z" }';
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(LaundryStyles.mediumBorderRadius),
          topLeft: Radius.circular(LaundryStyles.mediumBorderRadius),
        )
      ),
      padding: LaundryStyles.mediumPaddingStyle,
      child: Row(
        children: [
          Expanded(
            child: RepaintBoundary(
              key: Utils.orderReceiptImageGlobalKey,
              child: Container(
                color: Colors.white,
                child: Row(
                  children: [
                    QrImage(
                      foregroundColor: LaundryAppColors.darkBlue,
                      data: qrData,
                      version: QrVersions.auto,
                      size: 150.0,
                    ),
                    SizedBox(width: LaundryStyles.mediumGapSize),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Order', style: LaundryStyles.mediumNormalBlueTextStyle),
                          Text('#BX2344', style: LaundryStyles.xLargeBoldBlueTextStyle),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LaundryActionButton(
                  label: 'Print Receipt',
                  color: LaundryAppColors.successGreen,
                  icon: Icons.print,
                  onPressed: () {
                    context.read<PrintingService>().printImageBluetooth();
                    //GoRouter.of(Utils.rootNavigatorKey.currentContext!).pop();
                  },
                ),
              ],
            ),
          )
          
        ],
      ),

    );
  }
}