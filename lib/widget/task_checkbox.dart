import 'package:flutter/material.dart';

class TaskCheckbox extends StatelessWidget {
  final bool checkboxState;
  final Function(bool?) checkboxToggleState;
  const TaskCheckbox(
      {Key? key,
      required this.checkboxState,
      required this.checkboxToggleState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Checkbox(value: checkboxState, onChanged: checkboxToggleState);
  }
}
