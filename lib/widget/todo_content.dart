import 'package:flutter/material.dart';
import 'task_list.dart';

class TodoContent extends StatelessWidget {
  const TodoContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white, child: const TaskList());
  }
}
