import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/helpers/laundry_icons_icons.dart';
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
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: LaundryAppColors.mainBlue.withOpacity(0.25),
        borderRadius: BorderRadius.circular(50)
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: LaundryAppColors.mainBlue,
              borderRadius: BorderRadius.circular(40)
            ),
            child: Icon(order.garment.icon, color: Colors.white, size: 40),
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
                            alignment: Alignment.center,
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: LaundryAppColors.darkBlue.withOpacity(order.amount > 0 ? 1 : 0.25),
                              borderRadius: BorderRadius.circular(40)
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
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: currentOption.isSelected ? 
                                        LaundryAppColors.mainBlue : Colors.white.withOpacity(0.45),
                                      borderRadius: BorderRadius.circular(40)
                                    ),
                                    child: Icon(
                                      currentOption.service.icon,
                                      color: currentOption.isSelected ? Colors.white : LaundryAppColors.darkBlue,
                                      size: 40
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