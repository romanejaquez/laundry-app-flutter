import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_app/helpers/laundry_header_actions.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:laundry_app/helpers/utils.dart';
import 'package:laundry_app/services/laundry_header_options_service.dart';
import 'package:laundry_app/services/printing_service.dart';
import 'package:laundry_app/widgets/side_panel_toggle.dart';
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
              children: [
                //const SidePanelToggle(),
                SizedBox(width: LaundryStyles.smallGapSize),
                ...optionsService.allOptions.map((o) {
                return GestureDetector(
                  onTap: () {
                    switch(o.action) {
                      case LaundryHeaderActions.exit:
                        GoRouter.of(Utils.rootNavigatorKey.currentContext!).go('/landing');
                        break;
                      case LaundryHeaderActions.back:
                        break;
                      case LaundryHeaderActions.settings:
                        break;
                      case LaundryHeaderActions.wifi:
                        context.read<PrintingService>().printImageBluetooth();
                        break;
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 65,
                    height: 65,
                    color: o.bgColor,
                    child: Icon(o.icon, color: o.iconColor)
                  ),
                );
              }).toList()
              ],
            ),
          )
        ],
      )
    );
  }
}