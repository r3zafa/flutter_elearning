import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskList with ChangeNotifier {
  final List<Task> _list = [];
  int _listLength = 0;

  // gatters
  List<Task> get list => _list;
  int get listLength => _listLength;

  void addTask(Task newTask) {
    _list.add(newTask);
    _listLength++;
    notifyListeners();
  }

  void removeTask(int index) {
    _list.removeAt(index);
    _listLength--;
    notifyListeners();
  }

  void editTask({
    required int index,
    required String newText,
  }) {
    _list[index].taskText = newText;
    notifyListeners();
  }

  void taskDone({
    required int index,
    required bool? isDone,
  }) {
    _list[index].toggleDone();
    notifyListeners();
  }
}
