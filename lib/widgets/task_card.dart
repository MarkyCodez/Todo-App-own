import 'package:flutter/material.dart';
import 'package:new_todo_app/utils/date_format.dart';

class TaskCard extends StatelessWidget {
  final VoidCallback onPressed;
  final VoidCallback onDelete;
  final String titleText;
  final String subTitleText;
  final DateTime dateTime;
  const TaskCard({
    super.key,
    required this.dateTime,
    required this.onPressed,
    required this.onDelete,
    required this.titleText,
    required this.subTitleText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    maxLines: 3,
                    titleText,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(
                    Icons.delete,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Text(
                subTitleText,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(dateFormat(dateTime)),
            )
          ],
        ),
      ),
    );
  }
}
