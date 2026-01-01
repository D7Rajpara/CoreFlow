import 'package:flutter/material.dart';

class AppAlertDialogUtils {
  static Future<bool> showConfirmDialog(
    BuildContext context, {
    required String title,
    required String message,
    String okText = "OK",
    String cancelText = "Cancel",
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(cancelText),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(okText),
          ),
        ],
      ),
    );
    return result ?? false; // return false if dialog dismissed
  }
}
