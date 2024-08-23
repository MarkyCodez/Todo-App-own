import 'package:flutter/material.dart';
import 'package:new_todo_app/boxes/my_boxes.dart';
import 'package:new_todo_app/constants/constants.dart';
import 'package:new_todo_app/pages/settings_page.dart';
import 'package:new_todo_app/pages/view_task_out.dart';
import 'package:new_todo_app/widgets/go_to_home.dart';
import 'package:new_todo_app/widgets/text_title.dart';

class ViewLabels extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) {
        return const ViewLabels();
      });
  const ViewLabels({super.key});

  @override
  State<ViewLabels> createState() => _ViewLabelsState();
}

class _ViewLabelsState extends State<ViewLabels> {
  late int n;

  @override
  void initState() {
    setState(() {});
    n = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, SettingsPage.route());
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        actions: const [
          GoToHome(),
        ],
        centerTitle: true,
        title: const Text('Labels'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          if (category == categories[0]) {
            n = workBox.length;
          } else if (category == categories[1]) {
            n = personalBox.length;
          } else if (category == categories[2]) {
            n = hobbiesBox.length;
          } else if (category == categories[3]) {
            n = studyBox.length;
          } else {
            n = otherBox.length;
          }
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                ViewTaskOut.route(
                  label: category,
                ),
              );
            },
            title: TextTitle(title: category, size: 18),
            subtitle: Text('$n tasks'),
          );
        },
      ),
    );
  }
}
