import 'package:flutter/material.dart';

import '../models/task.dart';

class PopUpMenu extends StatelessWidget {
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback editTaskCallback;
  final VoidCallback restoreTaskCallback;

  final Task task;
  const PopUpMenu({
    super.key,
    required this.cancelOrDeleteCallback,
    required this.task,
    required this.editTaskCallback,
    required this.restoreTaskCallback,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: (task.isDeleted == false
            ? (context) => [
                  PopupMenuItem(
                      onTap: editTaskCallback,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.mode_edit_outlined),
                          label: const Text('Edit'))),
                  PopupMenuItem(
                      onTap: cancelOrDeleteCallback,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.delete_outline_outlined),
                          label: const Text('Delete')))
                ]
            : (context) => [
                  PopupMenuItem(
                      onTap: restoreTaskCallback,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.restore),
                          label: const Text('Restore'))),
                  PopupMenuItem(
                      // onTap: () => _removeOrDeleteTask(context, task),
                      onTap: cancelOrDeleteCallback,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.delete_forever_outlined),
                          label: const Text('Delete Forever')))
                ]));
  }
}
