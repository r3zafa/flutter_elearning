import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.isDone,
    required this.taskTitle,
    required this.callBackFunction,
    required this.removeItem,
    required this.index,
  });

  final bool isDone;
  final String taskTitle;
  final void Function(bool? isDone) callBackFunction;
  final Function(int index) removeItem;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w700,
          decoration: isDone ? TextDecoration.lineThrough : null,
          decorationColor: isDone ? Colors.red : null,
          decorationThickness: 2,
          decorationStyle: TextDecorationStyle.solid,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          removeItem(index);
        },
      ),
      leading: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isDone,
        onChanged: callBackFunction,
      ),
    );
  }
}
