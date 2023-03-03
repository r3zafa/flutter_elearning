import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../providers/task_list.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    List<Task> list = context.watch<TaskList>().list;

    return ListTile(
      title: Text(
        list[index].taskText,
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w700,
          decoration: list[index].isDone ? TextDecoration.lineThrough : null,
          decorationColor: list[index].isDone ? Colors.red : null,
          decorationThickness: 2,
          decorationStyle: TextDecorationStyle.solid,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          Provider.of<TaskList>(context, listen: false).removeTask(index);
        },
      ),
      leading: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: list[index].isDone,
        onChanged: (bool? isDoneState) {
          Provider.of<TaskList>(context, listen: false)
              .taskDone(index: index, isDone: isDoneState);
        },
      ),
    );
  }
}
