import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final String title;
  final TextEditingController control;
  final double size;
  final IconData? icons;
  final int? lines;
  const SearchField({
    super.key,
    required this.title,
    required this.control,
    this.size = 60,
    this.icons,
    this.lines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: TextField(
        maxLines: lines,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        controller: control,
        decoration: InputDecoration(
          prefixIcon: icons != null ? Icon(icons) : null,
          contentPadding: const EdgeInsets.all(17),
          hintText: title,
          border: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
