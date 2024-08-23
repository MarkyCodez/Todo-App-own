import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_todo_app/pages/home_page.dart';
import 'package:new_todo_app/pages/sample_page.dart';
import 'package:new_todo_app/pages/view_labels.dart';
import 'package:new_todo_app/theme/switch_theme.dart';
import 'package:new_todo_app/widgets/text_title.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) {
        return const SettingsPage();
      });
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final searchController = TextEditingController();

  late bool isSwitch;

  @override
  Widget build(BuildContext context) {
    isSwitch = Provider.of<MySwitchTheme>(context, listen: false).isLightMode;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, HomePage.route());
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  SamplePage.route(
                    controller: searchController,
                  ),
                );
              },
              child: const SizedBox(
                width: double.infinity,
                child: TextTitle(
                  title: 'Search',
                  size: 22,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, ViewLabels.route());
              },
              child: const SizedBox(
                width: double.infinity,
                child: TextTitle(
                  title: 'Labels',
                  size: 22,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextTitle(
                    title: isSwitch ? 'Dark Mode' : 'Light Mode', size: 22),
                CupertinoSwitch(
                  value: Provider.of<MySwitchTheme>(context).isLightMode,
                  onChanged: (val) =>
                      Provider.of<MySwitchTheme>(context, listen: false)
                          .toggleTheme(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
