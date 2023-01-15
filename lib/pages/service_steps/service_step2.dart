import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:laundry_app/pages/service_steps/service_step_anim.dart';
import 'package:laundry_app/services/garment_options_service.dart';
import 'package:laundry_app/services/service_steps_service.dart';
import 'package:laundry_app/widgets/laundry_option_tile.dart';
import 'package:provider/provider.dart';

class ServiceStep2 extends StatelessWidget {
  const ServiceStep2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget stepWidget = Consumer<GarmentOptionsService>(
      builder: (context, garmentOptions, child) {

        ServiceStepsService sss = context.read<ServiceStepsService>();
        sss.setBaseService(garmentOptions);

        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: LaundryStyles.largePadding,
                top: LaundryStyles.mediumPadding
              ),
              child: Text('Select the Garment',
                style: LaundryStyles.header2TitleStyle
              ),
            ),
            SizedBox(height: LaundryStyles.smallGapSize),
            Expanded(
              child: Wrap(
                runSpacing: LaundryStyles.smallGapSize,
                spacing: LaundryStyles.smallGapSize,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                children: List.generate(garmentOptions.garments.length,
                  (index) {
                    var currentGarment = garmentOptions.garments[index];

                    return LaundryOptionTile(
                      label: currentGarment.garment.label,
                      icon: currentGarment.garment.icon,
                      isSelected: currentGarment.isSelected,
                      onOptionPressed: () {
                        garmentOptions.selectGarment(currentGarment);
                      },  
                    );
                  }),
              )
            ),
          ],
        );
      }
    );

    return ServiceStepAnimation(childStep: stepWidget);
  }
}