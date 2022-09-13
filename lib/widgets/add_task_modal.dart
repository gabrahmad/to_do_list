import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/task_data.dart';

class AddTaskModal extends StatelessWidget {
  const AddTaskModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String taskName = '';
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      'Add Task',
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ListTile(
                      title: TextField(
                        autofocus: true,
                        onChanged: (value) {
                          taskName = value;
                        },
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: 'Enter the task name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      trailing: TextButton(
                        onPressed: () {
                          context.read<TaskData>().addNewTask(taskName);
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Add',
                          style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
      },
      backgroundColor: Colors.lightBlueAccent,
      child: const Icon((Icons.add)),
    );
  }
}
