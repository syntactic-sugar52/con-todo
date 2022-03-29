import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool? checkboxState) checkBoxCallBack;
  final Function() longPressCallback;
  const TaskTile(
      {Key? key,
      required this.isChecked,
      required this.taskTitle,
      required this.longPressCallback,
      required this.checkBoxCallBack})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: checkBoxCallBack,
      ),
    );
  }
}
