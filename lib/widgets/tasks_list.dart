import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/task_data.dart';

class TasksList extends StatefulWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    var tasks = context.watch<TaskData>().tasks;
    return ListView.builder(
      itemBuilder: (context, index) => TaskTile(tasks[index]),
      itemCount: tasks.length,
    );
  }
}
