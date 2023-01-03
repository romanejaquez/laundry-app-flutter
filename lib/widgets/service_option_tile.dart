import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:laundry_app/models/service_option.dart';

class ServiceOptionTile extends StatefulWidget {

  final ServiceOption option;
  const ServiceOptionTile({
    super.key,
    required this.option  
  });

  @override
  State<ServiceOptionTile> createState() => _ServiceOptionTileState();
}

class _ServiceOptionTileState extends State<ServiceOptionTile> {
  
  bool isPressed = false;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onHighlightChanged: (value) {
            setState(() {
              isPressed = value;
            });
          },
          onTap: () {},
          splashColor: LaundryAppColors.darkBlue,
          highlightColor: LaundryAppColors.mainBlue,
          child: Container(
            padding: const EdgeInsets.all(50),
            decoration: BoxDecoration(
              color: isPressed ? LaundryAppColors.mainBlue : LaundryAppColors.mainBlue.withOpacity(0.05),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  widget.option.icon,
                  color: isPressed ? Colors.white : LaundryAppColors.darkBlue,
                  size: 80  
                ),
                const SizedBox(height: 20),
                Text(
                  widget.option.label,
                  style: isPressed ?  LaundryStyles.serviceOptionTileLabelPressed : LaundryStyles.serviceOptionTileLabelNormal  
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}