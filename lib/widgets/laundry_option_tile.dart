import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:laundry_app/helpers/utils.dart';

class LaundryOptionTile extends StatefulWidget {

  final String label;
  final IconData icon;
  final Function onOptionPressed;
  final bool isSelected;

  const LaundryOptionTile({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onOptionPressed  
  });

  @override
  State<LaundryOptionTile> createState() => _LaundryOptionTileState();
}

class _LaundryOptionTileState extends State<LaundryOptionTile> {
  
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    return Container(
      constraints: const BoxConstraints(minWidth: 250),
      margin: const EdgeInsets.all(10),
      child: Material(
        clipBehavior: Clip.antiAlias,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(LaundryStyles.mediumBorderRadius),
        child: InkWell(
          onTap: () {
            widget.onOptionPressed();
          },
          splashColor: LaundryAppColors.darkBlue,
          highlightColor: LaundryAppColors.mainBlue,
          child: Container(
            padding: const EdgeInsets.all(LaundryStyles.largePadding),
            decoration: BoxDecoration(
              color: widget.isSelected ? LaundryAppColors.mainBlue : LaundryAppColors.mainBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(LaundryStyles.mediumBorderRadius)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  widget.icon,
                  color: widget.isSelected ? Colors.white : LaundryAppColors.darkBlue,
                  size: LaundryStyles.lgIconSize
                ),
                SizedBox(height: LaundryStyles.mediumGapSize),
                Text(
                  widget.label,
                  textAlign: TextAlign.center,
                  style: widget.isSelected ? 
                    LaundryStyles.serviceOptionTileLabelPressed : 
                      LaundryStyles.serviceOptionTileLabelNormal  
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}