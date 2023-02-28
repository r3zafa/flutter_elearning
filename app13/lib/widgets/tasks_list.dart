import 'package:app13/models/task.dart';
import 'package:app13/widgets/task_tile.dart';
import 'package:flutter/material.dart';

class TasksList extends StatefulWidget {
  const TasksList({
    super.key,
    required this.tasks,
    required this.removeItem,
  });
  final List<Task> tasks;
  final Function(int index) removeItem;
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(
          isDone: widget.tasks[index].isDone,
          taskTitle: widget.tasks[index].name,
          callBackFunction: (bool? isDoneState) {
            setState(() {
              widget.tasks[index].toggleDone();
            });
          },
          removeItem: widget.removeItem,
          index: index,
        );
      },
    );
  }
}
