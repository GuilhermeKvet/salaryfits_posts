import 'package:flutter/material.dart';

void snackbarDialog(BuildContext context, String? message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.black.withOpacity(0.5),
      content: Text(
        message!,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    ),
  );
}
