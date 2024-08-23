import 'dart:io';

import 'package:flutter/material.dart';
import 'package:new_todo_app/boxes/my_boxes.dart';
import 'package:new_todo_app/common/snackBar.dart';
import 'package:new_todo_app/constants/constants.dart';
import 'package:new_todo_app/database/task_model.dart';
import 'package:new_todo_app/pages/home_page.dart';
import 'package:new_todo_app/theme/switch_theme.dart';
import 'package:new_todo_app/utils/pick_image.dart';
import 'package:new_todo_app/widgets/my_button.dart';
import 'package:new_todo_app/widgets/search_field.dart';
import 'package:provider/provider.dart';

class AddTasksPage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const AddTasksPage());
  const AddTasksPage({super.key});

  @override
  State<AddTasksPage> createState() => _AddTasksPageState();
}

class _AddTasksPageState extends State<AddTasksPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  File? image;

  void selectImage() async {
    final imageValue = await pickImage();
    if (imageValue != null) {
      setState(() {
        image = imageValue;
      });
    }
  }

  void addWorkTasks(String s) {
    workBox.put(
      'key_${titleController.text.trim()}',
      TaskModel(
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        imagePath: image!.path,
        category: s,
        dateTime: DateTime.now(),
      ),
    );
  }

  void addPersonalTask(String s) {
    personalBox.put(
      'key_${titleController.text.trim()}',
      TaskModel(
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        imagePath: image!.path,
        category: s,
        dateTime: DateTime.now(),
      ),
    );
  }

  void addHobbiesTask(String s) {
    hobbiesBox.put(
      'key_${titleController.text.trim()}',
      TaskModel(
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        imagePath: image!.path,
        category: s,
        dateTime: DateTime.now(),
      ),
    );
  }

  void addStudyTask(String s) {
    studyBox.put(
      'key_${titleController.text.trim()}',
      TaskModel(
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        imagePath: image!.path,
        category: s,
        dateTime: DateTime.now(),
      ),
    );
  }

  void allTasks(String cat) {
    otherBox.put(
      'key_${titleController.text.trim()}',
      TaskModel(
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        imagePath: image!.path,
        category: cat,
        dateTime: DateTime.now(),
      ),
    );
  }

  void addTaskFunc(String s) {
    if (s == categories[0]) {
      addWorkTasks(s);
      allTasks(s);
    } else if (s == categories[1]) {
      addPersonalTask(s);
      allTasks(s);
    } else if (s == categories[2]) {
      addHobbiesTask(s);
      allTasks(s);
    } else if (s == categories[3]) {
      addStudyTask(s);
      allTasks(s);
    } else {
      allTasks(s);
      addWorkTasks(s);
      addPersonalTask(s);
      addHobbiesTask(s);
      addStudyTask(s);
    } // here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Add note or attachment',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchField(
              title: 'Enter title',
              control: titleController,
            ),
            const SizedBox(
              height: 20,
            ),
            SearchField(
              size: 200,
              title: 'Enter description',
              control: descriptionController,
              lines: null,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: selectImage,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.attachment),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                const Text(
                  'Attachment',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            image != null
                ? Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Image.file(
                                image!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    image = null;
                                  });
                                },
                                icon: const Icon(
                                  Icons.cancel,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                : const SizedBox(
                    height: 20,
                  ),
            MyButton(
              text: 'Save',
              onTap: saveTask,
            ),
          ],
        ),
      ),
    );
  }

  void saveTask() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: categories.map((e) {
            return ListTile(
              onTap: () {
                setState(() {});
                addTaskFunc(
                  e,
                );
                Navigator.pop(context);
                Navigator.push(context, HomePage.route());
                snackBar(
                  context,
                  'Added in $e',
                  Provider.of<MySwitchTheme>(context, listen: false)
                      .isLightMode,
                );
              },
              title: Text('Save to $e'),
            );
          }).toList(),
        );
      },
    );
  }
}
