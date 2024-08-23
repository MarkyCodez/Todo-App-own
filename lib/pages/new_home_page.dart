import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:new_todo_app/boxes/my_boxes.dart';
import 'package:new_todo_app/database/task_model.dart';
import 'package:new_todo_app/pages/view_tasks_in.dart';
import 'package:new_todo_app/widgets/text_title.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({super.key});

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  late Box<dynamic> lBox;

  @override
  void initState() {
    lBox = otherBox;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextTitle(
              title: 'Tasks',
              size: 30,
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 20,
            ),
            const TextTitle(
              title: 'Lists',
              size: 25,
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: lBox.length,
              itemBuilder: (context, index) {
                TaskModel l = lBox.getAt(index);
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      ViewTasksIn.route(
                        textTitle: l.title,
                        textSubTitle: l.description,
                        pathImage: l.imagePath,
                        category: l.category,
                        i: index,
                        time: l.dateTime,
                      ),
                    );
                  },
                  title: Text(
                    l.title,
                    style: const TextStyle(
                      fontSize: 19,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(0),
                  leading: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.blur_on_outlined,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
