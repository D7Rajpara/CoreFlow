import 'package:flutter/material.dart';

class AppImageTextButton extends StatelessWidget {
  final String? imagePath; // Image asset or network path (optional)
  final IconData? icon;
  final String text; // Button text
  final Color color; // Background color
  final Color? iconColor; //Optional: image or icon color
  final double iconSize; // Image/icon size
  final double spacing; // Space between image/icon and text
  final double borderRadius; // Rounded corners
  final VoidCallback onPressed; // Button action

  const AppImageTextButton({
    super.key,
    this.imagePath,
    this.icon,
    required this.text,
    required this.color,
    required this.onPressed,
    this.iconColor,
    this.iconSize = 24,
    this.spacing = 8,
    this.borderRadius = 12,
  }) : assert(
         imagePath != null || icon != null,
         'You must provide either an imagePath or an icon.',
       );

  @override
  Widget build(BuildContext context) {
    Widget? leadingWidget;

    // ✅ Automatically select image or icon
    if (imagePath != null) {
      leadingWidget = imagePath!.startsWith('http')
          ? Image.network(imagePath!, width: iconSize, height: iconSize)
          : Image.asset(imagePath!, width: iconSize, height: iconSize);
    } else if (icon != null) {
      leadingWidget = Icon(
        icon,
        size: iconSize,
        color: iconColor ?? Colors.white,
      );
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 0, // ✅ no shadow
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingWidget != null) leadingWidget,
          if (leadingWidget != null) SizedBox(width: spacing),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
