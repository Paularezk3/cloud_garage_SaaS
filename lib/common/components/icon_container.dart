import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class IconContainer extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final bool showShadow;
  final double padding;

  const IconContainer({
    super.key,
    required this.icon,
    this.iconColor,
    this.showShadow = true,
    this.padding = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: AppColors.primarySecondary, // Background color.
        border: Border.all(
          color: Colors.white, // Thin white border.
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(12), // Rounded corners.
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1), // Subtle shadow.
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ]
            : null, // No shadow if disabled.
      ),
      child: Icon(
        icon,
        color: iconColor ?? Colors.grey[800],
        size: 24,
      ),
    );
  }
}
