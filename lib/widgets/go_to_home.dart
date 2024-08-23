import 'package:flutter/material.dart';
import 'package:new_todo_app/pages/home_page.dart';

class GoToHome extends StatelessWidget {
  const GoToHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: IconButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            HomePage.route(),
            (route) => false,
          );
        },
        icon: const Icon(
          Icons.home,
        ),
      ),
    );
  }
}
