import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/helpers/laundry_icons_icons.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  late Timer splashTimer;
  
  @override
  void initState() {
    super.initState();

    splashTimer = Timer(const Duration(seconds: 2), () {
      GoRouter.of(context).go('/landing');
    });

  }

  @override
  void dispose() {
    splashTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: LaundryAppColors.mainBlue,
      body: Center(
        child: Icon(
          LaundryIcons.logo,
          color: Colors.white,
          size: 100
        ),
      )
    );
  }
}