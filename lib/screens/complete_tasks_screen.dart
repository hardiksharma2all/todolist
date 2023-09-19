import 'package:flutter/material.dart';
import 'package:todolist/blocs/bloc_exports.dart';
import 'package:todolist/widgets/task_listview.dart';

import '../models/task.dart';

class CompleteTasksScreen extends StatelessWidget {
  static const id = 'complete_Tasks_Screen';

  const CompleteTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      List<Task> taskList = state.completeTasks;
      return Column(
        children: [
          Center(
              child: Chip(
                  label: Text(
                      '${taskList.length} Completed | ${state.pendingTasks.length} Pending'))),
          TaskListView(taskList: taskList),
        ],
      );
    });
  }
}
