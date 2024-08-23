import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_todo_app/boxes/my_boxes.dart';
import 'package:new_todo_app/database/task_model.dart';
import 'package:new_todo_app/pages/view_tasks_in.dart';

class SamplePage extends StatefulWidget {
  final TextEditingController mySearchController;
  static route({required TextEditingController controller}) =>
      MaterialPageRoute(builder: (context) {
        return SamplePage(
          mySearchController: controller,
        );
      });
  const SamplePage({
    super.key,
    required this.mySearchController,
  });

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  late Box<dynamic> listed;

  List<TaskModel> l1 = [];

  void addInList() {
    l1.clear();
    for (int i = 0; i < listed.length; i++) {
      l1.add(listed.getAt(i));
    }
  }

  late bool f;

  @override
  void initState() {
    f = false;
    listed = otherBox;
    addInList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          f = false;
        });
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: TextField(
                  onTap: () {
                    setState(() {
                      f = true;
                    });
                  },
                  onChanged: searching,
                  maxLines: 1,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  controller: widget.mySearchController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(CupertinoIcons.search),
                    contentPadding: EdgeInsets.all(17),
                    hintText: 'Search',
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              f
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: l1.length,
                      itemBuilder: (context, index) {
                        final other = l1[index];
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              ViewTasksIn.route(
                                textTitle: other.title,
                                textSubTitle: other.description,
                                pathImage: other.imagePath,
                                category: other.category,
                                i: index,
                                time: other.dateTime,
                              ),
                            );
                          },
                          title: Text(other.title),
                        );
                      },
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  void searching(String query) {
    final suggestions = l1.where((l) {
      final q = query.toLowerCase();
      final title = l.title.toLowerCase();
      return title.contains(q);
    }).toList();
    setState(() {
      query.isEmpty ? addInList() : l1 = suggestions;
    });
  }
}
