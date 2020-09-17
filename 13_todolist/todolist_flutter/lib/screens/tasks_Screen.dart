import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:todolist_flutter/models/task_data.dart';
import 'package:todolist_flutter/widgets/tasks_list.dart';
import 'package:todolist_flutter/screens/add_task_screen.dart';
import 'package:todolist_flutter/models/task.dart';
import 'package:provider/provider.dart';

class TasksCreen extends StatefulWidget {
  @override
  _TasksCreenState createState() => _TasksCreenState();
}

class _TasksCreenState extends State<TasksCreen> {
  List<Task> tasks = [
    Task(name: 'segunda tarea el dia'),
    Task(name: 'segunda tarea el dia'),
    Task(name: 'tercera tarea el dia'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              ),
            ),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 40.0,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  'TodoList',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} tareas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TasksList(
//                tasks: tasks,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
