import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_todo_app/pages/add_tasks_page.dart';
import 'package:new_todo_app/pages/new_home_page.dart';
import 'package:new_todo_app/pages/settings_page.dart';
import 'package:new_todo_app/widgets/my_button.dart';

class HomePage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) {
        return const HomePage();
      });
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 4.0),
        child: MyButton(
            text: 'New Remainder',
            icons: Icons.add,
            onTap: () {
              Navigator.push(context, AddTasksPage.route());
            }),
      ),
      appBar: AppBar(
        leading: const SizedBox(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, SettingsPage.route());
            },
            icon: const Icon(
              CupertinoIcons.settings,
            ),
          ),
        ],
      ),
      body: const NewHomePage(),
    );
  }
}
