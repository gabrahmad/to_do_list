import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/task_data.dart';

import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile(this.task, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: task.isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: (bool? newValue) =>
            context.read<TaskData>().toggleTaskDone(task, newValue!),
      ),
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: TextButton(
        onPressed: () {
          context.read<TaskData>().removeTask(task);
        },
        child: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    );
  }
}
