import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:new_todo_app/boxes/my_boxes.dart';
import 'package:new_todo_app/common/snackBar.dart';
import 'package:new_todo_app/constants/constants.dart';
import 'package:new_todo_app/database/task_model.dart';
import 'package:new_todo_app/pages/view_labels.dart';
import 'package:new_todo_app/pages/view_tasks_in.dart';
import 'package:new_todo_app/theme/switch_theme.dart';
import 'package:new_todo_app/widgets/go_to_home.dart';
import 'package:new_todo_app/widgets/task_card.dart';
import 'package:provider/provider.dart';

class ViewTaskOut extends StatefulWidget {
  final String label;
  static route({required String label}) =>
      MaterialPageRoute(builder: (context) {
        return ViewTaskOut(
          label: label,
        );
      });
  const ViewTaskOut({
    super.key,
    required this.label,
  });

  @override
  State<ViewTaskOut> createState() => _ViewTaskOutState();
}

class _ViewTaskOutState extends State<ViewTaskOut> {
  late Box<dynamic> newBox;

  void selectBox() {
    if (widget.label == categories[0]) {
      newBox = workBox;
    } else if (widget.label == categories[1]) {
      newBox = personalBox;
    } else if (widget.label == categories[2]) {
      newBox = hobbiesBox;
    } else if (widget.label == categories[3]) {
      newBox = studyBox;
    } else {
      newBox = otherBox;
    }
  }

  void deletingTask(int i) {
    if (widget.label == categories[0]) {
      workBox.deleteAt(i);
    } else if (widget.label == categories[1]) {
      personalBox.deleteAt(i);
    } else if (widget.label == categories[2]) {
      hobbiesBox.deleteAt(i);
    } else if (widget.label == categories[3]) {
      studyBox.deleteAt(i);
    } else {
      otherBox.deleteAt(i);
    }
  }

  @override
  void initState() {
    selectBox();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, ViewLabels.route());
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        actions: const [
          GoToHome(),
        ],
        title: Text(widget.label),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: newBox.length,
          itemBuilder: (context, index) {
            TaskModel task;
            if (widget.label == categories[0]) {
              task = workBox.getAt(index);
            } else if (widget.label == categories[1]) {
              task = personalBox.getAt(index);
            } else if (widget.label == categories[2]) {
              task = hobbiesBox.getAt(index);
            } else if (widget.label == categories[3]) {
              task = studyBox.getAt(index);
            } else {
              task = otherBox.getAt(index);
            }
            return TaskCard(
              onPressed: () {
                Navigator.push(
                  context,
                  ViewTasksIn.route(
                    textTitle: task.title,
                    textSubTitle: task.description,
                    pathImage: task.imagePath,
                    category: widget.label,
                    i: index,
                    time: task.dateTime,
                  ),
                );
              },
              onDelete: () {
                setState(() {
                  deletingTask(index);
                });
                snackBar(
                  context,
                  'Task deleted',
                  Provider.of<MySwitchTheme>(context, listen: false)
                      .isLightMode,
                );
                Navigator.pushReplacement(
                  context,
                  ViewTaskOut.route(
                    label: widget.label,
                  ),
                );
              },
              titleText: task.title,
              subTitleText: task.description,
              dateTime: task.dateTime,
            );
          },
        ),
      ),
    );
  }
}
