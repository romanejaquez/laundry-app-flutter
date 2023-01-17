import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:laundry_app/services/amount_garment_services_selection.dart';
import 'package:laundry_app/services/garment_options_service.dart';
import 'package:laundry_app/widgets/services_per_garment.dart';
import 'package:provider/provider.dart';

class GarmentServiceSelection extends StatelessWidget {
  const GarmentServiceSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AmountGarmentServicesSelection>(
      builder: ((context, service, child) {

        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 20),
            itemCount: service.orderItems.length,
            itemBuilder: ((context, index) {

              var garmentOrderItem = service.orderItems[index];

              return Container(
                margin: EdgeInsets.only(top: LaundryStyles.smallMargin, bottom: LaundryStyles.smallMargin),
                padding: const EdgeInsets.all(LaundryStyles.mediumPadding),
                decoration: BoxDecoration(
                  color: LaundryAppColors.mainBlue.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(100)
                ),
                child: Row(
                  children: [
                    Container(
                      width: LaundryStyles.serviceIconContainer,
                      height: LaundryStyles.serviceIconContainer,
                      margin: EdgeInsets.only(right: LaundryStyles.largeMargin),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: LaundryAppColors.mainBlue,
                        borderRadius: BorderRadius.circular(LaundryStyles.xLargeBorderRadius)
                      ),
                      child: Icon(
                        garmentOrderItem.garment.icon,
                        color: Colors.white, 
                        size: LaundryStyles.smallIconSize
                      ),
                    ),
                    
                    ClipOval(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            service.incrementAmount(garmentOrderItem.id);
                          },
                          child: Container(
                            width: LaundryStyles.serviceIconContainer,
                            height: LaundryStyles.serviceIconContainer,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: LaundryAppColors.darkBlue.withOpacity(garmentOrderItem.amount > 0 ? 1 : 0.25),
                              borderRadius: BorderRadius.circular(LaundryStyles.xLargeBorderRadius)
                            ),
                            child: Text('${garmentOrderItem.amount}', 
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

                    Expanded(
                      child: ServicesPerGarment(
                        orderItem: garmentOrderItem
                      )
                    )
                  ]
                )
              );
            })
          ),
        );

      })
    );
  }
}