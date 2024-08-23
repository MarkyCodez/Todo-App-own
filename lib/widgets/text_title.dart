import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String title;
  final double size;
  const TextTitle({
    super.key,
    required this.title,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
