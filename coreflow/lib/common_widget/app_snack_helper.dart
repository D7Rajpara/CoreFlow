import 'package:coreflow/main.dart';
import 'package:flutter/material.dart';

class AppSnackHelper {
  //  Show a green success message
  static void showSuccess(String message) {
    _showSnackBar(
      message,
      backgroundColor: Colors.green.shade600,
      icon: Icons.check_circle_outline,
    );
  }

  //  Show a red error message
  static void showError(String message) {
    _showSnackBar(
      message,
      backgroundColor: Colors.red.shade600,
      icon: Icons.error_outline,
    );
  }

  //  Show a blue info message
  static void showInfo(String message) {
    _showSnackBar(
      message,
      backgroundColor: Colors.blue.shade600,
      icon: Icons.info_outline,
    );
  }

  // Private core method
  static void _showSnackBar(
    String message, {
    required Color backgroundColor,
    required IconData icon,
  }) {
    final messenger = messengerKey.currentState;
    messenger?.removeCurrentSnackBar(); // remove previous one
    messenger?.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(12),
        duration: const Duration(seconds: 2),
        backgroundColor: backgroundColor,
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
// #DR NOTE: user Anywhere
AppSnackHelper.showSuccess("Profile updated!");
AppSnackHelper.showError("Failed to upload image!");
AppSnackHelper.showInfo("Welcome back!");

 void saveUser() async {
    try {
      // your save logic...
      AppSnackHelper.showSuccess("User saved successfully!");
    } catch (e) {
      AppSnackHelper.showError("Save failed: $e");
    }
  }*/
