import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/helpers/laundry_icons_icons.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:laundry_app/helpers/utils.dart';
import 'package:laundry_app/services/laundry_left_tab_nav_service.dart';
import 'package:provider/provider.dart';

class LaundryLeftNav extends StatelessWidget {
  const LaundryLeftNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      color: LaundryAppColors.mainBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(LaundryStyles.mediumPadding),
            child: const Icon(
              LaundryIcons.logo, 
              color: Colors.white, 
              size: LaundryStyles.mediumIconSize
            ),
          ),
          Expanded(
            child: Consumer<LaundryLeftTabNavService>(
              builder: ((context, service, child) {
                
                List<Widget> tabs = service.allTabs.map((tab) {
                  return GestureDetector(
                    onTap: () {
                      service.selectTab(tab);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 5),
                      padding: EdgeInsets.all(LaundryStyles.mediumPadding),
                      decoration: tab.isSelected ? LaundryStyles.selectedTabDecoration : LaundryStyles.normalTabDecoration,
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: Container(
                          margin: tab.isSelected ? const EdgeInsets.only(bottom: 40) : null,
                          child: Text(
                            tab.label,
                            style: tab.isSelected ? LaundryStyles.leftNavTabNormalTextStyle : LaundryStyles.leftNavTabSelectedTextStyle
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: tabs,
                );
              }),
            ),
          )
        ],
      )
    );
  }
}