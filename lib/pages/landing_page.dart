import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/helpers/laundry_icons_icons.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Icon(LaundryIcons.logo, color: LaundryAppColors.darkBlue),
        iconTheme: const IconThemeData(color: LaundryAppColors.darkBlue),
        leading: null,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width > 500 ? 400 : MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width * 0.25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Select Feature:', textAlign: TextAlign.center, style: LaundryStyles.headerTitleStyle),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: LaundryAppColors.darkBlue,
                  shape: const StadiumBorder(),
                  elevation: 0.0,
                  shadowColor: Colors.transparent
                ),
                onPressed: () {
                  GoRouter.of(context).go('/services');
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.dry_cleaning, size: 30),
                      SizedBox(width: 40),
                      Text('Point-of-Sale',
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 20)
                      )
                    ],
                  ),
                )
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: LaundryAppColors.mainBlue,
                  shape: const StadiumBorder(),
                  elevation: 0,
                  shadowColor: Colors.transparent
                ),
                onPressed: () {
                  GoRouter.of(context).go('/qrscanner');
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.qr_code, size: 30),
                      SizedBox(width: 40),
                      Text('QR Scanner',
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 20)
                      )
                    ],
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}