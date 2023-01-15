import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:laundry_app/services/amount_garment_services_selection.dart';
import 'package:laundry_app/widgets/garment_service_selection.dart';
import 'package:provider/provider.dart';

class ServiceStep3 extends StatelessWidget {
  const ServiceStep3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    context.read<AmountGarmentServicesSelection>().generateSelectedOptions();
    
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(
            left: LaundryStyles.largePadding,
            top: LaundryStyles.mediumPadding
          ),
          child: Text('Select amount and services',
            style: LaundryStyles.header2TitleStyle
          ),
        ),
        SizedBox(height: LaundryStyles.smallGapSize),
        const Expanded(
          child: GarmentServiceSelection()
        )
      ]
    );
  }
}