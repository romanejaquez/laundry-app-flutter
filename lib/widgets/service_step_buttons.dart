import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/services/service_steps_service.dart';
import 'package:laundry_app/widgets/laundry_action_button.dart';
import 'package:provider/provider.dart';

class ServiceStepButtons extends StatelessWidget {
  const ServiceStepButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceStepsService>(
      builder: (context, stepService, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            stepService.isLastStep() ? 
            const SizedBox.shrink() : LaundryActionButton(
              label: 'Reset All',
              color: LaundryAppColors.darkBlue,
              icon: Icons.restart_alt,
              onPressed: stepService.selectionsMade() ? () {
                stepService.resetAll();
              } : null,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                    stepService.isLastStep() ? 
                    const SizedBox.shrink() :
                    LaundryActionButton(
                      label: 'Previous Step',
                      color: LaundryAppColors.darkBlue,
                      icon: Icons.arrow_left,
                      onPressed: stepService.currentStep!.stepIndex > 0 ? () {
                        stepService.goBackToPreviousStep();
                      } : null,
                    ),
                    const SizedBox(width: 20),
                    stepService.isLastStep() ? 
                      LaundryActionButton(
                        label: 'Start Over',
                        color: LaundryAppColors.successGreen,
                        icon: Icons.start_rounded,
                        onPressed: () {
                          stepService.startOver();
                        },
                      ) : 
                      LaundryActionButton(
                        label: 'Next Step',
                        color: LaundryAppColors.darkBlue,
                        icon: Icons.arrow_right,
                        onPressed: stepService.canGoToNextStep() ? () {
                          stepService.moveToNextStep();
                        } : null,
                      ),
                ],
              ),
            ),
          ],
        );
      }
    );
  }
}