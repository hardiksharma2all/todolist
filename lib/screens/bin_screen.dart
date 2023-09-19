import 'package:flutter/material.dart';
import 'package:todolist/blocs/bloc_exports.dart';
import 'package:todolist/screens/custom_drawer.dart';

import '../models/task.dart';
import '../widgets/task_listview.dart';

class BinScreen extends StatelessWidget {
  static const id = 'bin_Screen';

  const BinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.removeTasks;
        return Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            centerTitle: false,
            title: const Text('Bin'),
            actions: [
              IconButton(
                onPressed: () => context.read<TaskBloc>().add(DeleteAllTask()),
                icon: const Icon(Icons.delete_outline_outlined),
              ),
            ],
          ),
          body: Column(
            children: [
              Center(
                  child: Chip(
                      label: Text(state.removeTasks.isEmpty
                          ? 'Empty Bin'
                          : '${state.removeTasks.length} Deleted Tasks'))),
              TaskListView(taskList: taskList),
            ],
          ),
        );
      },
    );
  }
}
