import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_todo_app/boxes/my_boxes.dart';
import 'package:new_todo_app/database/task_model.dart';
import 'package:new_todo_app/pages/home_page.dart';
import 'package:new_todo_app/theme/my_theme.dart';
import 'package:new_todo_app/theme/switch_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  workBox = await Hive.openBox('work_box');
  personalBox = await Hive.openBox('personal_box');
  hobbiesBox = await Hive.openBox('hobbies_box');
  studyBox = await Hive.openBox('study_box');
  otherBox = await Hive.openBox('other_box');
  runApp(
    ChangeNotifierProvider(
      create: (context) => MySwitchTheme(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<MySwitchTheme>(context).theme,
      darkTheme: MyTheme.darkMode,
      title: 'New Todo App',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
