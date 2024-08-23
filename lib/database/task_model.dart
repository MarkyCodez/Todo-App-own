import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel {
  TaskModel({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.category,
    required this.dateTime,
  });
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  String imagePath;

  @HiveField(3)
  String category;

  @HiveField(4)
  DateTime dateTime;
}
