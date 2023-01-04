import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:laundry_app/services/laundry_header_options_service.dart';
import 'package:provider/provider.dart';

class LaundryHeader extends StatelessWidget {
  const LaundryHeader({super.key});

  @override
  Widget build(BuildContext context) {

    LaundryHeaderOptionsService optionsService = context.read<LaundryHeaderOptionsService>();
    
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 15),
            child: Text('Wave Cleaners',
              style: LaundryStyles.headerTitleStyle
            )
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: optionsService.allOptions.map((o) {
                return Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  color: o.bgColor,
                  child: Icon(o.icon, color: o.iconColor)
                );
              }).toList(),
            ),
          )
        ],
      )
    );
  }
}