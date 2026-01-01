import 'package:coreflow/common_widget/app_button.dart';
import 'package:coreflow/common_widget/app_text.dart';
import 'package:coreflow/constant/color_constant.dart';
import 'package:flutter/material.dart';

class AppAlert {
  static Future<void> show({
    required BuildContext context,
    required String title,
    required String message,
    String buttonText = "OK",
    VoidCallback? onPressed,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      builder: (_) => Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withValues(
              alpha: 0.9,
            ), // 👈 semi-transparent box
            borderRadius: BorderRadius.circular(16),
          ),
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(
                  text: title,
                  color: textColor,
                  textAlign: TextAlign.center,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                AppText(
                  text: message,
                  color: textColor,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                AppButton(
                  label: buttonText,
                  color: navigationBarColor,
                  onPressed: () {
                    Navigator.of(context).pop();
                    onPressed?.call();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
