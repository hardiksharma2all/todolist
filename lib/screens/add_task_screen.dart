import 'package:flutter/material.dart';
import 'package:todolist/services/uuidgenerator.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';
import '../utils/dimensions.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descController = TextEditingController();

    return Container(
      padding: EdgeInsets.all(Dimension.height20),
      child: Column(
        children: [
          Text(
            'Add Task',
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
                  var task = Task(
                      title: titleController.text,
                      id: UUIDGen.generate(),
                      desc: descController.text,
                      date: DateTime.now().toString());
                  context.read<TaskBloc>().add(AddTask(task: task));
                  Navigator.pop(context);
                },
                child: const Text('Add'),
              )
            ],
          )
        ],
      ),
    );
  }
}
