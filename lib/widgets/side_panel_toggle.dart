import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/services/order_received_notification_service.dart';
import 'package:laundry_app/services/side_panel_service.dart';
import 'package:provider/provider.dart';

class SidePanelToggle extends StatelessWidget {
  const SidePanelToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SidePanelService>(
      builder: (context, sidePanelService, child) {

        var icon = sidePanelService.showSidePanel ? Icons.toggle_off : Icons.toggle_on;
        var label = sidePanelService.showSidePanel ? 'Side Panel Off' : 'Side Panel On';
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
              child: Row(
                children: [
                  Icon(
                    icon, 
                    color: color,
                    size: 50
                  ),
                  const SizedBox(width: 10),
                  Text(label,
                    style: TextStyle(
                      color: color, 
                      fontSize: 20
                    )
                  )
                ],
              )
            ),
          ],
        );
      }
    );
  }
}