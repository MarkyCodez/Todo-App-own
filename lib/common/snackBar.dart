import 'package:flutter/material.dart';

void snackBar(BuildContext context, String text, bool f) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        content: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: f ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
}
