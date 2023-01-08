import 'package:flutter/material.dart';

class SidePanelService extends ChangeNotifier {

  bool showSidePanel = false;

  void toggleSidePanel() {
    showSidePanel = !showSidePanel;
    notifyListeners();
  }
}