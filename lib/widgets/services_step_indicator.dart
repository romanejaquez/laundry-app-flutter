import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/services/service_steps_service.dart';
import 'package:provider/provider.dart';

class ServicesStepIndicator extends StatefulWidget {
  const ServicesStepIndicator({super.key});

  @override
  State<ServicesStepIndicator> createState() => _ServicesStepIndicatorState();
}

class _ServicesStepIndicatorState extends State<ServicesStepIndicator> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceStepsService>(
      builder: (context, service, child) {

        return Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: List.generate(service.steps.length, (index) {

              var stepColor = service.currentStep!.stepIndex == index ||
                service.steps[index].isComplete ?
                LaundryAppColors.mainBlue : LaundryAppColors.lightGray;

              var stepBullet = Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: stepColor,
                  borderRadius: BorderRadius.circular(20)
                ),
              );

              return index == 0 ? stepBullet : Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        height: 20,
                        decoration: BoxDecoration(
                        color: stepColor,
                        borderRadius: BorderRadius.circular(20)
                      ),
                    )
                  ),
                  stepBullet,
                ]),
              );
            })
          )
        );
      }
    );
  }
}