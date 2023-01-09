import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';

class LaundryActionButton extends StatelessWidget {

  final String label;
  final Color color;
  final IconData icon;
  Function? onPressed;

  LaundryActionButton({super.key,
    this.onPressed, 
    required this.label, 
    required this.color, 
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: const StadiumBorder(),
        elevation: 0,
        shadowColor: Colors.transparent
      ),
      onPressed: onPressed != null ? () { onPressed!(); } : null,
      child: Padding(
        padding: EdgeInsets.all(LaundryStyles.smallPadding),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(icon, size: 50),
            const SizedBox(width: 20),
            Text(label,
              style: const TextStyle(fontSize: 30)
            )
          ],
        ),
      )
    );
  }
}