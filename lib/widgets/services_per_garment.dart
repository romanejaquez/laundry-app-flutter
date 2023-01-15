import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:laundry_app/models/garment_orderitem.dart';

class ServicesPerGarment extends StatelessWidget {

  final GarmentOrderItem orderItem;
  const ServicesPerGarment({super.key, required this.orderItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(orderItem.options.length, (index) {
        var currentOption = orderItem.options[index];

        return Container(
          margin: const EdgeInsets.only(left: 15),
          child: ClipOval(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  //qdService.selectServiceOption(order.id, currentOption);
                },
                highlightColor: LaundryAppColors.mainBlue,
                splashColor: LaundryAppColors.mainBlue,
                child: Container(
                  width: LaundryStyles.serviceIconContainer,
                  height: LaundryStyles.serviceIconContainer,
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
      })
    );
  }
}