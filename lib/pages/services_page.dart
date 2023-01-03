import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/helpers/laundry_icons_icons.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:laundry_app/services/services_option_service.dart';
import 'package:laundry_app/widgets/service_option_tile.dart';
import 'package:laundry_app/widgets/services_step_indicator.dart';
import 'package:provider/provider.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {

    var serviceOptions = context.read<ServicesOptionService>();
    
    return Container(
      padding: const EdgeInsets.all(30),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const ServicesStepIndicator(),
          const Text('Select the Service',
            style: LaundryStyles.mainHeaderTitleStyle
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: serviceOptions.options.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return ServiceOptionTile(option: serviceOptions.options[index]);
              }),
            )
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: LaundryAppColors.darkBlue,
              shape: const StadiumBorder(),
              elevation: 0,
              shadowColor: Colors.transparent
            ),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.dry_cleaning, size: 50),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text('Quick Drop-Off',
                      style: TextStyle(fontSize: 30)
                    ),
                  )
                ],
              ),
            )
          ),
          const SizedBox(height: 50),
        ],
      )
    );
  }
}