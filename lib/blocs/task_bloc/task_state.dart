part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> pendingTasks;
  final List<Task> completeTasks;
  final List<Task> favouriteTasks;
  final List<Task> removeTasks;

  const TaskState(
      {this.pendingTasks = const <Task>[],
      this.completeTasks = const <Task>[],
      this.favouriteTasks = const <Task>[],
      this.removeTasks = const <Task>[]});

  @override
  List<Object> get props =>
      [pendingTasks, completeTasks, favouriteTasks, removeTasks];
  Map<String, dynamic> toMap() {
    return {
      'pendingTasks': pendingTasks.map((e) => e.toMap()).toList(),
      'completeTasks': completeTasks.map((e) => e.toMap()).toList(),
      'favouriteTasks': favouriteTasks.map((e) => e.toMap()).toList(),
      'removeTasks': removeTasks.map((e) => e.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      pendingTasks:
          List<Task>.from(map['pendingTasks']?.map((e) => Task.fromMap(e))),
      completeTasks:
          List<Task>.from(map['completeTasks']?.map((e) => Task.fromMap(e))),
      favouriteTasks:
          List<Task>.from(map['favouriteTasks']?.map((e) => Task.fromMap(e))),
      removeTasks:
          List<Task>.from(map['removeTasks']?.map((e) => Task.fromMap(e))),
    );
  }
}
