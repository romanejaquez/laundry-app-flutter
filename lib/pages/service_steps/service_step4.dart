import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:laundry_app/widgets/laundry_action_button.dart';
import 'package:laundry_app/widgets/receipt_view_toast.dart';

class ServiceStep4 extends StatelessWidget {
  const ServiceStep4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.verified,
            size: LaundryStyles.xlgIconSize,
            color: LaundryAppColors.darkBlue
          ),
          Text('Order', style: LaundryStyles.mediumNormalBlueTextStyle),
          Text('#BX2344', style: LaundryStyles.xLargeBoldBlueTextStyle),
          Text('is complete!', style: LaundryStyles.normalBlueTextStyle),
          const SizedBox(height: 20),
          LaundryActionButton(
            label: 'View Receipt',
            color: LaundryAppColors.mainBlue,
            icon: Icons.receipt,
            onPressed: () {

              showModalBottomSheet(
                useRootNavigator: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return ReceiptViewToast();
                });
            },
          )

        ],
      ),
    );
  }
}