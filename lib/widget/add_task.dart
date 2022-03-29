import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';

class AddTask extends StatelessWidget {
  AddTask({
    Key? key,
  }) : super(key: key);
  final TextEditingController addTask = TextEditingController();

  Column column(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 29,
        ),
        const Center(
            child: Text(
          'New Task',
          style: TextStyle(fontSize: 20),
        )),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 350,
          child: TextFormField(
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.multiline,
            controller: addTask,
            maxLines: 5,
            decoration: const InputDecoration(
              hintText: 'description',
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
            width: 340,
            child: ElevatedButton(
                onPressed: () {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(addTask.text);
                  Navigator.pop(context);
                },
                child: const Text('ADD'))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20))),
          child: column(context)),
    );
  }
}
