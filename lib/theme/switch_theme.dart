import 'package:flutter/material.dart';
import 'package:new_todo_app/theme/my_theme.dart';

class MySwitchTheme extends ChangeNotifier {
  ThemeData _theme = MyTheme.darkMode;
  ThemeData get theme => _theme;
  bool get isLightMode => _theme == MyTheme.lightMode;
  set theme(ThemeData theme) {
    _theme = theme;
    notifyListeners();
  }

  void toggleTheme() {
    _theme == MyTheme.darkMode
        ? theme = MyTheme.lightMode
        : theme = MyTheme.darkMode;
  }
}
