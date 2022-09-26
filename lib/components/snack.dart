import 'package:flutter/material.dart';

class Snack {
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        padding: const EdgeInsets.all(14),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
