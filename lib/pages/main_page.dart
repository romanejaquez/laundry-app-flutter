import 'package:flutter/material.dart';
import 'package:laundry_app/widgets/laundry_header.dart';
import 'package:laundry_app/widgets/laundry_left_nav.dart';

class MainPage extends StatelessWidget {
  final Widget child;
  const MainPage({super.key, required this.child });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const LaundryLeftNav(),
          Expanded(
            child: Column(
              children: [
                const LaundryHeader(),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: child
                  )
                )
              ],
            ),
          )
        ],
      )
    );
  }
}