import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/utils/dimensions.dart';
import 'package:todolist/widgets/popup_menu.dart';

import '../blocs/bloc_exports.dart';
import '../screens/edit_task_screen.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({super.key, required this.task});
  final Task task;

  void _removeOrDeleteTask(BuildContext ctx, Task task) {
    task.isDeleted!
        ? ctx.read<TaskBloc>().add(DeleteTask(task: task))
        : ctx.read<TaskBloc>().add(RemoveTask(task: task));
  }

  void _editTask(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.viewInsetsOf(context).bottom),
                child: EditTaskScreen(
                  oldTasks: task,
                ),
              ),
            ));
    // print(MediaQuery.sizeOf(context).height);
    // print(MediaQuery.sizeOf(context).width);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: Dimension.width20,
              ),
              IconButton(
                onPressed: () => {
                  task.isFavourite == false
                      ? context
                          .read<TaskBloc>()
                          .add(MarkFavouriteTask(task: task))
                      : {
                          task.isFavourite == true,
                          context
                              .read<TaskBloc>()
                              .add(MarkFavouriteTask(task: task))
                        }
                },
                icon: task.isFavourite == false
                    ? const Icon(
                        Icons.favorite_border_outlined,
                      )
                    : const Icon(
                        Icons.favorite,
                      ),
              ),
              SizedBox(
                width: Dimension.width15,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Dimension.font18,
                            decoration: task.isDone!
                                ? TextDecoration.lineThrough
                                : null),
                      ),
                      SizedBox(
                        height: Dimension.height7,
                      ),
                      Text(DateFormat()
                          .add_yMMMd()
                          .add_Hms()
                          .format(DateTime.parse(task.date)))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Checkbox(
            value: task.isDone,
            onChanged: task.isDeleted == false
                ? (value) {
                    context.read<TaskBloc>().add(UpdateTask(task: task));
                  }
                : null),
        PopUpMenu(
          restoreTaskCallback: () =>
              context.read<TaskBloc>().add(RestoreTask(task: task)),
          cancelOrDeleteCallback: () => _removeOrDeleteTask(context, task),
          task: task,
          editTaskCallback: () {
            _editTask(context);
          },
        )
      ],
    );
  }
}

//ListTile(
//         title: Text(
//           task.title,
//           overflow: TextOverflow.ellipsis,
//           style: TextStyle(
//               decoration: task.isDone! ? TextDecoration.lineThrough : null),
//         ),
//         trailing: Checkbox(
//             value: task.isDone,
//             onChanged: task.isDeleted == false
//                 ? (value) {
//                     context.read<TaskBloc>().add(UpdateTask(task: task));
//                   }
//                 : null),
//         onLongPress: () => _removeOrDeleteTask(context, task))
