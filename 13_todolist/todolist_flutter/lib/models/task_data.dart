import 'package:flutter/foundation.dart';
import 'package:todolist_flutter/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'segunda tarea el dia'),
    Task(name: 'segunda tarea el dia'),
    Task(name: 'tercera tarea el dia'),
  ];

  int get taskCount {
    return _tasks.length;
  }

// getter con una lista inmodificable
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
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
