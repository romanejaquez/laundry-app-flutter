import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/services/service_steps_service.dart';
import 'package:provider/provider.dart';

class ServiceStepButtons extends StatelessWidget {
  const ServiceStepButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceStepsService>(
      builder: (context, stepService, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: LaundryAppColors.darkBlue,
                  shape: const StadiumBorder(),
                  elevation: 0,
                  shadowColor: Colors.transparent
                ),
                onPressed: stepService.currentStep!.stepIndex > 0 ? () {
                  stepService.goBackToPreviousStep();
                } : null,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(Icons.arrow_left, size: 50),
                      SizedBox(width: 20),
                      Text('Previous Step',
                        style: TextStyle(fontSize: 30)
                      )
                    ],
                  ),
                )
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: LaundryAppColors.darkBlue,
                  shape: const StadiumBorder(),
                  elevation: 0,
                  shadowColor: Colors.transparent
                ),
                onPressed: stepService.canGoToNextStep() ? () {
                  stepService.moveToNextStep();
                } : null,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text('Next Step',
                        style: TextStyle(fontSize: 30)
                      ),
                      SizedBox(width: 20),
                      Icon(Icons.arrow_right, size: 50),
                    ],
                  ),
                )
              ),
          ],
        );
      }
    );
  }
}