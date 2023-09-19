import 'package:flutter/material.dart';
import 'package:todolist/widgets/task_listtile.dart';

import '../models/task.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key, required this.taskList});
  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: taskList
              .map((task) => ExpansionPanelRadio(
                  value: task.id,
                  headerBuilder: (context, isOpen) => TaskListTile(task: task),
                  body: ListTile(
                    title: SelectableText.rich(TextSpan(children: [
                      const TextSpan(
                          text: 'Task\n',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: task.title),
                      const TextSpan(
                          text: '\n\nDescription\n',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: task.desc),
                    ])),
                  )))
              .toList(),
        ),
      ),
    );

    // return Expanded(
    //   child: ListView.builder(
    //       itemCount: taskList.length,
    //       itemBuilder: (context, index) {
    //         var task = taskList[index];
    //         return TaskListTile(task: task);
    //       }),
    // );
  }
}
