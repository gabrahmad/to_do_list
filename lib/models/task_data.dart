import 'package:flutter/foundation.dart';
import 'package:to_do_list/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
   
  ];

  void addNewTask(String taskTitle) {
    tasks.add(Task(taskTitle));
    notifyListeners();
  }

  void toggleTaskDone(Task task, bool newCheckStatus) {
    task.toggleTaskChecked(newCheckStatus);
    notifyListeners();
  }

  void removeTask(task) {
    tasks.remove(task);
    notifyListeners();
  }
}
