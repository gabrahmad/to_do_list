class Task {
  final String title;
  bool isChecked = false;
  Task(this.title);
  void toggleTaskChecked(bool newCheckStatus) {
    isChecked = newCheckStatus;
  }
}
