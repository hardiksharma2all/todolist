import 'package:flutter/material.dart';
import 'package:todolist/blocs/bloc_exports.dart';
import 'package:todolist/widgets/task_listview.dart';

import '../models/task.dart';

class PendingTasksScreen extends StatelessWidget {
  static const id = 'pending_Tasks_Screen';

  const PendingTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      List<Task> taskList = state.pendingTasks;
      return Column(
        children: [
          Center(
              child: Chip(
                  label: Text(
                      '${taskList.length} Pending | ${state.completeTasks.length} Completed'))),
          TaskListView(taskList: taskList),
        ],
      );
    });
  }
}
