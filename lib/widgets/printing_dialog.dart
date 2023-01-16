import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:rive/rive.dart';

class PrintingDialog extends StatefulWidget {
  const PrintingDialog({super.key});

  @override
  State<PrintingDialog> createState() => _PrintingDialogState();
}

class _PrintingDialogState extends State<PrintingDialog> {

  Timer printTimer = Timer(Duration.zero, () {});

  @override
  void initState() {
    super.initState();
    printTimer = Timer(const Duration(seconds: 5), () {
      GoRouter.of(context).pop();
    });
  }

  @override
  void dispose() {
    printTimer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height: 300,
        alignment: Alignment.center,
        padding: LaundryStyles.mediumPaddingStyle,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(LaundryStyles.largeBorderRadius)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 150, height: 150,
              child: RiveAnimation.asset(
                './assets/anims/printer_white.riv',
                fit: BoxFit.contain
              ),
            ),
            const SizedBox(height: 20),
            Text("Printing Receipt...", style: LaundryStyles.headerTitleStyle)
          ],
        )
      ),
    );
  }
}