import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:laundry_app/helpers/utils.dart';
import 'package:laundry_app/services/service_steps_service.dart';
import 'package:laundry_app/services/services_option_service.dart';
import 'package:laundry_app/services/side_panel_service.dart';
import 'package:laundry_app/widgets/laundry_option_tile.dart';
import 'package:laundry_app/widgets/service_step_buttons.dart';
import 'package:laundry_app/widgets/services_step_indicator.dart';
import 'package:laundry_app/widgets/side_panel_wrapper.dart';
import 'package:provider/provider.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Consumer<SidePanelService>(
          builder: (context, sidePanelService, child) {

            var icon = sidePanelService.showSidePanel ? Icons.toggle_off : Icons.toggle_on;
            var label = sidePanelService.showSidePanel ? 'Toggle Off' : 'Toggle On';
            var color = sidePanelService.showSidePanel ? LaundryAppColors.darkBlue : LaundryAppColors.mainBlue;
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    shape: const StadiumBorder()
                  ),
                  onPressed: () {
                    context.read<SidePanelService>().toggleSidePanel();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          icon, 
                          color: color,
                          size: 60
                        ),
                        const SizedBox(width: 10),
                        Text(label,
                          style: TextStyle(
                            color: color, 
                            fontSize: 30
                          )
                        )
                      ],
                    ),
                  )
                ),
              ],
            );
          }
        ),

        // main region
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const ServicesStepIndicator(),
                      Expanded(
                        child: Consumer<ServiceStepsService>(
                          builder: (context, stepService, child) {
                            return stepService.currentStep!.stepView;
                          },
                        ),
                      ),
                      const ServiceStepButtons()
                    ],
                  )
                ),
              ),
              
              // side panel (expandable)
              const SidePanelWrapper()
            ],
          ),
        ),
      ],
    );
  }
}