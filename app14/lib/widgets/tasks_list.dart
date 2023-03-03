import 'package:app14/models/task.dart';
import 'package:app14/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task_list.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    int listLength = context.watch<TaskList>().listLength;

    return ListView.builder(
      itemCount: listLength,
      itemBuilder: (context, index) {
        return TaskTile(
          index: index,
        );
      },
    );
  }
}
