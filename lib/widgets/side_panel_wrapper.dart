import 'package:flutter/material.dart';
import 'package:laundry_app/services/side_panel_service.dart';
import 'package:provider/provider.dart';

class SidePanelWrapper extends StatelessWidget {
  const SidePanelWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SidePanelService>(
      builder: (context, sidePanelService, child) {
        return sidePanelService.showSidePanel ?
        Container(
          color: Colors.white,
          constraints: const BoxConstraints(minWidth: 200),
          child: Column(
            children: [
              Text('side panel'),
            ],
          )
        ) : const SizedBox.shrink();
      }
    );
  }
}