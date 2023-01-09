import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:laundry_app/services/service_steps_service.dart';
import 'package:laundry_app/services/services_option_service.dart';
import 'package:laundry_app/widgets/laundry_option_tile.dart';
import 'package:provider/provider.dart';

class ServiceStep1 extends StatelessWidget {
  const ServiceStep1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {  

    return Consumer<ServicesOptionService>(
      builder: (context, serviceOptions, child) {

        ServiceStepsService sss = context.read<ServiceStepsService>();
        sss.setBaseService(serviceOptions);
        
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: LaundryStyles.largePadding,
                top: LaundryStyles.mediumPadding
              ),
              child: const Text('Select the Service',
                style: LaundryStyles.header2TitleStyle
              ),
            ),
            SizedBox(height: LaundryStyles.smallGapSize),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  runSpacing: 10,
                  spacing: 10,
                  direction: Axis.horizontal,
                  children: List.generate(serviceOptions.options.length,
                    (index) {
                      var currentOption = serviceOptions.options[index];
                      return LaundryOptionTile(
                        label: currentOption.service.label,
                        icon: currentOption.service.icon,
                        isSelected: currentOption.isSelected,
                        onOptionPressed: () {
                          serviceOptions.selectService(currentOption);
                        },
                      );
                    }),
                ),
              ),
            )
          ],
        );
      }
    );
  }
}