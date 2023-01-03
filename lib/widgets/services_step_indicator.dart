import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';

class ServicesStepIndicator extends StatefulWidget {
  const ServicesStepIndicator({super.key});

  @override
  State<ServicesStepIndicator> createState() => _ServicesStepIndicatorState();
}

class _ServicesStepIndicatorState extends State<ServicesStepIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: List.generate(7, (index) {
          return index % 2 == 0 ? 
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: LaundryAppColors.lightGray,
              borderRadius: BorderRadius.circular(20)
            ),
          ) : Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              height: 10,
              decoration: BoxDecoration(
              color: LaundryAppColors.lightGray,
              borderRadius: BorderRadius.circular(20)
            ),
            ),
          );
        })
      )
    );
  }
}