import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:laundry_app/services/quickdropoff_service.dart';
import 'package:laundry_app/widgets/quick_dropoff_row.dart';
import 'package:provider/provider.dart';

class QuickDropoffPage extends StatelessWidget {
  const QuickDropoffPage({super.key});

  @override
  Widget build(BuildContext context) {

    var quickDropoffService = context.read<QuickDropoffService>();
    
    return Container(
      padding: const EdgeInsets.all(30),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.dry_cleaning,
                color: LaundryAppColors.darkBlue,
                size: LaundryStyles.defaultIconSize
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('Quick Drop-Off',
                    style: LaundryStyles.header1TitleStyle
                  ),
                  Text('6 or Less Items',
                    style: LaundryStyles.header3TitleStyle
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: quickDropoffService.orderItems.length,
              itemBuilder: ((context, index) {
                var quickDropoffItem = quickDropoffService.orderItems[index];
                return QuickDropoffRow(order: quickDropoffItem);
              })
            )
          )
        ]
      )
    );
  }
}