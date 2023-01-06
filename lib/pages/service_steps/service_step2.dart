import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:laundry_app/services/garment_options_service.dart';
import 'package:laundry_app/widgets/laundry_option_tile.dart';
import 'package:provider/provider.dart';

class ServiceStep2 extends StatelessWidget {
  const ServiceStep2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var garmentOptions = context.read<GarmentOptionsService>();

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
            child: GridView.count(
              crossAxisCount: 5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              scrollDirection: Axis.vertical,
              childAspectRatio: 0.8,
              children: List.generate(garmentOptions.garments.length,
                (index) {
                  var currentGarment = garmentOptions.garments[index];

                  return LaundryOptionTile(
                    label: currentGarment.label,
                    icon: currentGarment.icon,
                    onOptionPressed: () {},  
                  );
                }),
            ),
          )
        ),
      ],
    );
  }
}