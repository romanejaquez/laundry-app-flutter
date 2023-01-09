import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:laundry_app/models/quick_dropoff_order_item.dart';
import 'package:laundry_app/services/quickdropoff_service.dart';
import 'package:provider/provider.dart';

class QuickDropoffRow extends StatelessWidget {

  final QuickDropoffOrderItem order;

  const QuickDropoffRow({
    super.key,
    required this.order  
  });

  @override
  Widget build(BuildContext context) {

    double serviceIconContainer = 80;

    return Container(
      margin: EdgeInsets.only(top: LaundryStyles.smallMargin, bottom: LaundryStyles.smallMargin),
      padding: EdgeInsets.all(LaundryStyles.mediumPadding),
      decoration: BoxDecoration(
        color: LaundryAppColors.mainBlue.withOpacity(0.25),
        borderRadius: BorderRadius.circular(100)
      ),
      child: Row(
        children: [
          Container(
            width: serviceIconContainer,
            height: serviceIconContainer,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: LaundryAppColors.mainBlue,
              borderRadius: BorderRadius.circular(LaundryStyles.xLargeBorderRadius)
            ),
            child: Icon(
              order.garment.icon, 
              color: Colors.white, 
              size: LaundryStyles.smallIconSize
            ),
          ),
          Expanded(
            child: Consumer<QuickDropoffService>(
              builder: (context, qdService, child) {

                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClipOval(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            qdService.incrementAmount(order.id);
                          },
                          child: Container(
                            width: serviceIconContainer,
                            height: serviceIconContainer,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: LaundryAppColors.darkBlue.withOpacity(order.amount > 0 ? 1 : 0.25),
                              borderRadius: BorderRadius.circular(LaundryStyles.xLargeBorderRadius)
                            ),
                            child: Text('${order.amount}', 
                              style: const TextStyle(
                                color: Colors.white, 
                                fontSize: 50, 
                                fontWeight: FontWeight.bold
                              )
                            )
                          ),
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(
                        order.options.length, (index) {

                          var currentOption = order.options[index];

                          return Container(
                            margin: const EdgeInsets.only(left: 15),
                            child: ClipOval(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    qdService.selectServiceOption(order.id, currentOption);
                                  },
                                  highlightColor: LaundryAppColors.mainBlue,
                                  splashColor: LaundryAppColors.mainBlue,
                                  child: Container(
                                    width: serviceIconContainer,
                                    height: serviceIconContainer,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: currentOption.isSelected ? 
                                        LaundryAppColors.mainBlue : Colors.white.withOpacity(0.45),
                                      borderRadius: BorderRadius.circular(60)
                                    ),
                                    child: Icon(
                                      currentOption.service.icon,
                                      color: currentOption.isSelected ? Colors.white : LaundryAppColors.darkBlue,
                                      size: LaundryStyles.smallIconSize
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      ),
                    )
                  ],
                );
              }
            ),
          )
        ],
      )
    );
  }
}