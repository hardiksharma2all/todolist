import 'package:flutter/material.dart';
import 'package:todolist/blocs/bloc_exports.dart';
import 'package:todolist/widgets/task_listview.dart';

import '../models/task.dart';

class FavouriteTasksScreen extends StatelessWidget {
  static const id = 'favourite_Tasks_Screen';

  const FavouriteTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      List<Task> taskList = state.favouriteTasks;
      return Column(
        children: [
          Center(
              child: Chip(
                  label: Text(
                      '${taskList.length} Favourites | ${state.pendingTasks.length} Pending'))),
          TaskListView(taskList: taskList),
        ],
      );
    });
  }
}
