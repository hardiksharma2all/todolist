import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';
import '../utils/dimensions.dart';

class EditTaskScreen extends StatelessWidget {
  final Task oldTasks;
  const EditTaskScreen({super.key, required this.oldTasks});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: oldTasks.title);
    TextEditingController descController =
        TextEditingController(text: oldTasks.desc);

    return Container(
      padding: EdgeInsets.all(Dimension.height20),
      child: Column(
        children: [
          Text(
            'Edit Task',
            style: TextStyle(fontSize: Dimension.font25),
          ),
          SizedBox(
            height: Dimension.height10,
          ),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
                label: Text('Title'), border: OutlineInputBorder()),
          ),
          SizedBox(
            height: Dimension.height10,
          ),
          TextField(
            autofocus: true,
            maxLines: 5,
            minLines: 3,
            controller: descController,
            decoration: const InputDecoration(
                label: Text('Description'), border: OutlineInputBorder()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  var editedTask = Task(
                      title: titleController.text,
                      id: oldTasks.id,
                      isFavourite: oldTasks.isFavourite,
                      isDone: false,
                      desc: descController.text,
                      date: DateTime.now().toString());
                  context
                      .read<TaskBloc>()
                      .add(EditTask(oldTask: oldTasks, newTask: editedTask));
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              )
            ],
          )
        ],
      ),
    );
  }
}
