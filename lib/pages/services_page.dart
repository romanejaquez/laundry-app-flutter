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
import 'package:laundry_app/widgets/side_panel_toggle.dart';
import 'package:laundry_app/widgets/side_panel_wrapper.dart';
import 'package:provider/provider.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        const SidePanelToggle(),

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