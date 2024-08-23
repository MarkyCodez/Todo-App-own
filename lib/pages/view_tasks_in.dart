import 'dart:io';

import 'package:flutter/material.dart';
import 'package:new_todo_app/boxes/my_boxes.dart';
import 'package:new_todo_app/common/snackBar.dart';
import 'package:new_todo_app/constants/constants.dart';
import 'package:new_todo_app/database/task_model.dart';
import 'package:new_todo_app/pages/home_page.dart';
import 'package:new_todo_app/pages/view_task_out.dart';
import 'package:new_todo_app/theme/switch_theme.dart';
import 'package:new_todo_app/utils/date_format.dart';
import 'package:new_todo_app/widgets/search_field.dart';
import 'package:new_todo_app/widgets/text_title.dart';
import 'package:provider/provider.dart';

class ViewTasksIn extends StatefulWidget {
  static route({
    required String textTitle,
    required String textSubTitle,
    required String pathImage,
    required String category,
    required int i,
    required DateTime time,
  }) =>
      MaterialPageRoute(builder: (context) {
        return ViewTasksIn(
          textTitle: textTitle,
          textSubTitle: textSubTitle,
          pathImage: pathImage,
          category: category,
          i: i,
          time: time,
        );
      });
  final String textTitle;
  final String textSubTitle;
  final String pathImage;
  final String category;
  final int i;
  final DateTime time;
  const ViewTasksIn({
    super.key,
    required this.textTitle,
    required this.textSubTitle,
    required this.pathImage,
    required this.category,
    required this.i,
    required this.time,
  });

  @override
  State<ViewTasksIn> createState() => _ViewTasksInState();
}

class _ViewTasksInState extends State<ViewTasksIn> {
  final updateTitleController = TextEditingController();
  final updateDescriptionController = TextEditingController();

  void forUpdateWork(TaskModel t1) {
    workBox.getAt(widget.i);
    workBox.putAt(
      widget.i,
      t1,
    );
  }

  void forUpdateWorkWithOthers(TaskModel t1) {
    otherBox.getAt(widget.i);
    workBox.getAt(widget.i);
    workBox.putAt(
      widget.i,
      t1,
    );
    otherBox.putAt(
      widget.i,
      t1,
    );
  }

  void forUpdatePersonal(TaskModel t1) {
    personalBox.getAt(widget.i);
    personalBox.putAt(
      widget.i,
      t1,
    );
  }

  void forUpdatePersonalWithOthers(TaskModel t1) {
    otherBox.getAt(widget.i);
    personalBox.getAt(widget.i);
    personalBox.putAt(
      widget.i,
      t1,
    );
    otherBox.putAt(
      widget.i,
      t1,
    );
  }

  void forUpdateHobby(TaskModel t1) {
    hobbiesBox.getAt(widget.i);
    hobbiesBox.putAt(
      widget.i,
      t1,
    );
  }

  void forUpdateHobbyWithOthers(TaskModel t1) {
    otherBox.getAt(widget.i);
    hobbiesBox.getAt(widget.i);
    hobbiesBox.putAt(
      widget.i,
      t1,
    );
    otherBox.putAt(
      widget.i,
      t1,
    );
  }

  void forUpdateStudy(TaskModel t1) {
    studyBox.getAt(widget.i);
    studyBox.putAt(
      widget.i,
      t1,
    );
  }

  void forUpdateStudyWithOthers(TaskModel t1) {
    otherBox.getAt(widget.i);
    studyBox.getAt(widget.i);
    studyBox.putAt(
      widget.i,
      t1,
    );
    otherBox.putAt(
      widget.i,
      t1,
    );
  }

  void forUpdateOtherWithOthers(TaskModel t1) {
    otherBox.getAt(widget.i);
    otherBox.putAt(
      widget.i,
      t1,
    );
  }

  void updateWork(TaskModel task) {
    if (otherBox.containsKey('key_${widget.textTitle}')) {
      forUpdateWorkWithOthers(task);
    } else {
      forUpdateWork(task);
    }
  }

  void updatePersonal(TaskModel task) {
    if (otherBox.containsKey('key_${widget.textTitle}')) {
      forUpdatePersonalWithOthers(task);
    } else {
      forUpdatePersonal(task);
    }
  }

  void updateHobbies(TaskModel task) {
    if (otherBox.containsKey('key_${widget.textTitle}')) {
      forUpdateHobbyWithOthers(task);
    } else {
      forUpdateHobby(task);
    }
  }

  void updateStudy(TaskModel task) {
    if (otherBox.containsKey('key_${widget.textTitle}')) {
      forUpdateStudyWithOthers(task);
    } else {
      forUpdateStudy(task);
    }
  }

  void updateOthers(TaskModel task) {
    if (workBox.containsKey('key_${widget.textTitle}') &&
        personalBox.containsKey('key_${widget.textTitle}') &&
        hobbiesBox.containsKey('key_${widget.textTitle}') &&
        studyBox.containsKey('key_${widget.textTitle}')) {
      forUpdateWork(task);
      forUpdatePersonal(task);
      forUpdateHobby(task);
      forUpdateStudy(task);
      forUpdateOtherWithOthers(task);
    } else {
      forUpdateOtherWithOthers(task);
    }
  }

  void taskUpdate() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            height: 140,
            child: Column(
              children: [
                SearchField(
                  title: 'title',
                  control: updateTitleController,
                ),
                const SizedBox(
                  height: 20,
                ),
                SearchField(
                  title: 'Des',
                  control: updateDescriptionController,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  if (widget.category == categories[0]) {
                    updateWork(
                      TaskModel(
                        title: updateTitleController.text.trim(),
                        description: updateDescriptionController.text.trim(),
                        imagePath: widget.pathImage,
                        category: widget.category,
                        dateTime: widget.time,
                      ),
                    );
                  } else if (widget.category == categories[1]) {
                    updatePersonal(
                      TaskModel(
                        title: updateTitleController.text.trim(),
                        description: updateDescriptionController.text.trim(),
                        imagePath: widget.pathImage,
                        category: widget.category,
                        dateTime: widget.time,
                      ),
                    );
                  } else if (widget.category == categories[2]) {
                    updateHobbies(
                      TaskModel(
                        title: updateTitleController.text.trim(),
                        description: updateDescriptionController.text.trim(),
                        imagePath: widget.pathImage,
                        category: widget.category,
                        dateTime: widget.time,
                      ),
                    );
                  } else if (widget.category == categories[3]) {
                    updateStudy(
                      TaskModel(
                        title: updateTitleController.text.trim(),
                        description: updateDescriptionController.text.trim(),
                        imagePath: widget.pathImage,
                        category: widget.category,
                        dateTime: widget.time,
                      ),
                    );
                  } else {
                    updateOthers(
                      TaskModel(
                        title: updateTitleController.text.trim(),
                        description: updateDescriptionController.text.trim(),
                        imagePath: widget.pathImage,
                        category: widget.category,
                        dateTime: widget.time,
                      ),
                    );
                  } // here
                });
                Navigator.push(
                  context,
                  ViewTasksIn.route(
                    textTitle: updateTitleController.text.trim(),
                    textSubTitle: updateDescriptionController.text.trim(),
                    pathImage: widget.pathImage,
                    category: widget.category,
                    i: widget.i,
                    time: widget.time,
                  ),
                );
                snackBar(
                  context,
                  'Task updated',
                  Provider.of<MySwitchTheme>(context, listen: false)
                      .isLightMode,
                );
              },
              child: const Text('Update'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void deleteWork() {
    workBox.deleteAt(widget.i);
  }

  void deletePersonal() {
    personalBox.deleteAt(widget.i);
  }

  void deleteHobbies() {
    hobbiesBox.deleteAt(widget.i);
  }

  void deleteStudy() {
    studyBox.deleteAt(widget.i);
  }

  void deleteOthers() {
    otherBox.deleteAt(widget.i);
  }

  void update() {
    setState(() {});
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              onTap: () {
                Navigator.pop(context);
                taskUpdate();
              },
              title: const Text('Update'),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  if (widget.category == categories[0]) {
                    deleteWork();
                  } else if (widget.category == categories[1]) {
                    deletePersonal();
                  } else if (widget.category == categories[2]) {
                    deleteHobbies();
                  } else if (widget.category == categories[3]) {
                    deleteStudy();
                  } else {
                    deleteOthers();
                  }
                  Navigator.push(context, HomePage.route());
                  snackBar(
                    context,
                    'Task deleted',
                    Provider.of<MySwitchTheme>(context, listen: false)
                        .isLightMode,
                  );
                });
              },
              title: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    File imageFile = File(widget.pathImage);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              ViewTaskOut.route(
                label: widget.category,
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        actions: [
          IconButton(
            onPressed: update,
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      body: Scrollbar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      imageFile,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextTitle(title: widget.textTitle, size: 25),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.textSubTitle,
                  style: const TextStyle(height: 2, fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    dateFormat(
                      widget.time,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
