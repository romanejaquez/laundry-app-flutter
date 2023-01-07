import 'package:flutter/material.dart';

class SidePanelService extends ChangeNotifier {

  bool showSidePanel = true;

  void toggleSidePanel() {
    showSidePanel = !showSidePanel;
    notifyListeners();
  }
}