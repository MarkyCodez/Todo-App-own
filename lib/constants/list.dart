import 'package:flutter/material.dart';
import 'package:new_todo_app/database/task_model.dart';

class UpdateList extends ChangeNotifier {
  List<TaskModel> l1 = [];

  void addInList(TaskModel t3) {
    l1.add(t3);
    notifyListeners();
  }
}
