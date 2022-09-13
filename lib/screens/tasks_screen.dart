import 'package:flutter/material.dart';
import 'package:to_do_list/models/task_data.dart';
import 'package:to_do_list/widgets/add_task_modal.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    var tasks = context.watch<TaskData>().tasks;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        floatingActionButton: const AddTaskModal(),
        body: Column(
          children: [
            Container(
              height: 250.0,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      color: Colors.lightBlueAccent,
                      size: 40.0,
                    ),
                  ),
                  const Text(
                    'To Do List',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${tasks.length} Tasks',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                ),
                child: tasks.isEmpty
                    ? Container(
                        padding: const EdgeInsets.all(30),
                        child: const Text(
                          'There is no tasks to be done.\n\nAdd new tasks.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : const TasksList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
