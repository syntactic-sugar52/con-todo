import 'dart:collection';
import 'package:flutter/material.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [];

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newValue) {
    final task = Task(name: newValue);
    _tasks.add(task);
    notifyListeners();
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
