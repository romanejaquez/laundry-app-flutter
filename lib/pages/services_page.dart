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

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {

  late PageController ctrl;

  @override
  void initState() {
    super.initState();

    var stepService = context.read<ServiceStepsService>();
    ctrl = PageController(
      initialPage: stepService.currentStep != null ? stepService.currentStep!.stepIndex : 0
    );
  }
  
  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
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
                            
                            stepService.setPageController(ctrl);
                            return PageView(
                              controller: ctrl,
                              physics: const NeverScrollableScrollPhysics(),
                              children: stepService.steps.map((s) => s.stepView).toList(),
                            );
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