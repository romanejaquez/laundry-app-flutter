import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:laundry_app/services/order_received_notification_service.dart';
import 'package:laundry_app/widgets/order_row.dart';
import 'package:provider/provider.dart';

class OrderSearch extends StatefulWidget {
  const OrderSearch({super.key});

  @override
  State<OrderSearch> createState() => _OrderSearchState();
}

class _OrderSearchState extends State<OrderSearch> {

  late TextEditingController searchField;


  @override 
  void initState() {
    super.initState();

    searchField = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 30, right: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              color: Colors.grey.withOpacity(0.20),
              width: 5
            )
          ),
          height: 90,
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchField,
                  style: const TextStyle(fontSize: 25),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'i.e. BXC54567',
                    hintStyle: TextStyle(color: Colors.grey)
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Material(
                  color: LaundryAppColors.darkBlue.withOpacity(0.5),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: LaundryAppColors.darkBlue.withOpacity(0.5)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.search, color: Colors.white, size: 30),
                          SizedBox(width: 20),
                          Text('Search',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                            )
                          ),
                          SizedBox(width: 10),
                        ]
                      ),
                    )
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Consumer<OrderReceivedNotificationService>(
            builder: (context, service, child) {
              return service.orderReceived ? ListView.builder(
                itemCount: 1,
                itemBuilder: ((context, index) {
                  return OrderRow(order: service.receivedOrder!);
                }),
              ) : Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.search, size: LaundryStyles.lgIconSize, color: LaundryAppColors.darkBlue),
                    Text('No orders at the moment', style: LaundryStyles.mediumNormalBlueTextStyle)
                  ],
                ),
              );
            }
          ),
        )
      ],
    );
  }
}