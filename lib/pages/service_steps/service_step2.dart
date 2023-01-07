import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:laundry_app/services/garment_options_service.dart';
import 'package:laundry_app/services/service_steps_service.dart';
import 'package:laundry_app/widgets/laundry_option_tile.dart';
import 'package:provider/provider.dart';

class ServiceStep2 extends StatelessWidget {
  const ServiceStep2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Consumer<GarmentOptionsService>(
      builder: (context, garmentOptions, child) {

        ServiceStepsService sss = context.read<ServiceStepsService>();
        sss.setBaseService(garmentOptions);

        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 30),
              child: Text('Select the Garment',
                style: LaundryStyles.header1TitleStyle
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Wrap(
                  runSpacing: 10,
                  spacing: 10,
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
                ),
              )
            ),
          ],
        );
      }
    );
  }
}