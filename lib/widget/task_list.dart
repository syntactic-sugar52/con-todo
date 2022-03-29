import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/task_data.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskdata, child) {
        return Padding(
          padding: const EdgeInsets.only(top: 230),
          child: ListView.builder(
            itemBuilder: (context, index) {
              final task = taskdata.tasks[index];
              return TaskTile(
                  isChecked: task.isDone,
                  taskTitle: task.name,
                  longPressCallback: () {
                    taskdata.deleteTask(task);
                  },
                  checkBoxCallBack: (checkboxState) {
                    taskdata.updateTask(task);
                  });
            },
            itemCount: taskdata.taskCount,
          ),
        );
      },
    );
  }
}
