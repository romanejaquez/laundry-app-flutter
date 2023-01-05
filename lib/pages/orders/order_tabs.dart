import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/helpers/utils.dart';
import 'package:laundry_app/services/order_tab_selection_service.dart';
import 'package:provider/provider.dart';

class OrderTabs extends StatelessWidget {
  const OrderTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderTabSelectionService>(
      builder: (context, orderTabService, child) {
        
        return Container(
          margin: const EdgeInsets.only(left: 50, right: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              orderTabService.orderTabs.length, (index) {

                var orderTab = orderTabService.orderTabs[index];
                var orderTabBgColor = orderTab.isSelected ? LaundryAppColors.lightGray : LaundryAppColors.mainBlue.withOpacity(0.5);
                var orderTabLabelColor = orderTab.isSelected ? Colors.black : Colors.white;

                return GestureDetector(
                  onTap: () {
                    orderTabService.selectTab(orderTab);
                    GoRouter.of(Utils.orderPageNavigationKey.currentContext!).go(orderTab.route);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    padding: const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
                    decoration: BoxDecoration(
                      color: orderTabBgColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)
                      )
                    ),
                    child: Text(orderTab.label,
                      style: TextStyle(
                        color: orderTabLabelColor,
                        fontSize: 25, 
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ),
                );
              })
          ),
        );
      }
    );
  }
}