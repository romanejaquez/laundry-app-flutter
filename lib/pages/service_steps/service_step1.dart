import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:laundry_app/services/services_option_service.dart';
import 'package:laundry_app/widgets/laundry_option_tile.dart';
import 'package:provider/provider.dart';

class ServiceStep1 extends StatelessWidget {
  const ServiceStep1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var serviceOptions = context.read<ServicesOptionService>();

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 30, top: 30),
          child: Text('Select the Service',
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
              childAspectRatio: 0.8,
              scrollDirection: Axis.vertical,
              children: List.generate(serviceOptions.options.length,
                (index) {
                  var currentOption = serviceOptions.options[index];
                  return LaundryOptionTile(
                    label: currentOption.label,
                    icon: currentOption.icon,
                    onOptionPressed: () {

                    },
                  );
                }),
            ),
          )
        ),
      ],
    );
  }
}