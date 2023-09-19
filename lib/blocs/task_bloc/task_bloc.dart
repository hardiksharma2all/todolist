import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../models/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<RemoveTask>(_onRemoveTask);
    on<DeleteTask>(_onDeleteTask);
    on<MarkFavouriteTask>(_onMarkFavouriteTask);
    on<EditTask>(_onEditTask);
    on<RestoreTask>(_onRestoreTask);
    on<DeleteAllTask>(_onDeleteAllTask);
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        pendingTasks: List.from(state.pendingTasks)..add(event.task),
        completeTasks: state.completeTasks,
        favouriteTasks: state.favouriteTasks,
        removeTasks: state.removeTasks));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;
    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completeTasks = state.completeTasks;
    List<Task> favouriteTasks = state.favouriteTasks;

    if (task.isDone == false) {
      if (task.isFavourite == false) {
        pendingTasks = List.from(pendingTasks)..remove(task);
        completeTasks = List.from(completeTasks)
          ..insert(0, task.copyWith(isDone: true));
      } else {
        var taskIndex = pendingTasks.indexOf(event.task);
        pendingTasks = List.from(pendingTasks)..remove(task);
        completeTasks.insert(0, task.copyWith(isDone: true));
        favouriteTasks = List.from(favouriteTasks)
          ..remove(task)
          ..insert(taskIndex, task.copyWith(isDone: true));
      }
    } else {
      if (task.isFavourite == false) {
        completeTasks = List.from(completeTasks)..remove(event.task);
        pendingTasks = List.from(pendingTasks)
          ..insert(0, task.copyWith(isDone: false));
      } else {
        var taskIndex = favouriteTasks.indexOf(task);
        completeTasks = List.from(completeTasks)..remove(task);
        pendingTasks = List.from(pendingTasks)
          ..insert(0, task.copyWith(isDone: false));

        favouriteTasks = List.from(favouriteTasks)
          ..remove(task)
          ..insert(taskIndex, task.copyWith(isDone: false));
      }
    }
    emit(TaskState(
        pendingTasks: pendingTasks,
        completeTasks: completeTasks,
        favouriteTasks: favouriteTasks,
        removeTasks: state.removeTasks));
  }

  void _onRemoveTask(RemoveTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        pendingTasks: List.from(state.pendingTasks)..remove(event.task),
        completeTasks: List.from(state.completeTasks)..remove(event.task),
        favouriteTasks: List.from(state.favouriteTasks)..remove(event.task),
        removeTasks: List.from(state.removeTasks)
          ..add(event.task.copyWith(isDeleted: true))));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        pendingTasks: state.pendingTasks,
        completeTasks: state.completeTasks,
        favouriteTasks: state.favouriteTasks,
        removeTasks: List.from(state.removeTasks)..remove(event.task)));
  }

  void _onMarkFavouriteTask(MarkFavouriteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completeTasks = state.completeTasks;
    List<Task> favouriteTasks = state.favouriteTasks;
    if (event.task.isDone == false) {
      if (event.task.isFavourite == false) {
        var taskIndex = pendingTasks.indexOf(event.task);
        pendingTasks = List.from(pendingTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavourite: true));
        favouriteTasks.insert(0, event.task.copyWith(isFavourite: true));
      } else {
        var taskIndex = pendingTasks.indexOf(event.task);
        pendingTasks = List.from(pendingTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavourite: false));
        favouriteTasks.remove(event.task);
      }
    } else {
      if (event.task.isFavourite == false) {
        var taskIndex = completeTasks.indexOf(event.task);
        completeTasks = List.from(completeTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavourite: true));
        favouriteTasks.insert(0, event.task.copyWith(isFavourite: true));
      } else {
        var taskIndex = completeTasks.indexOf(event.task);
        completeTasks = List.from(completeTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavourite: false));
        favouriteTasks.remove(event.task);
      }
    }
    emit(TaskState(
      pendingTasks: pendingTasks,
      favouriteTasks: favouriteTasks,
      completeTasks: completeTasks,
      removeTasks: state.removeTasks,
    ));
  }

  void _onEditTask(EditTask event, Emitter<TaskState> emit) {
    final state = this.state;
    List<Task> favouriteTasks = state.favouriteTasks;
    if (event.oldTask.isFavourite == true) {
      favouriteTasks
        ..remove(event.oldTask)
        ..insert(0, event.newTask);
    }
    emit(TaskState(
        pendingTasks: List.from(state.pendingTasks)
          ..remove(event.oldTask)
          ..insert(0, event.newTask),
        completeTasks: state.completeTasks..remove(event.oldTask),
        favouriteTasks: favouriteTasks,
        removeTasks: state.removeTasks));
  }

  void _onRestoreTask(RestoreTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        removeTasks: List.from(state.removeTasks)..remove(event.task),
        favouriteTasks: state.favouriteTasks,
        completeTasks: state.completeTasks,
        pendingTasks: List.from(state.pendingTasks)
          ..insert(0, event.task.copyWith(isDone: false, isDeleted: false))));
  }

  void _onDeleteAllTask(DeleteAllTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        removeTasks: List.from(state.removeTasks)..clear(),
        favouriteTasks: state.favouriteTasks,
        completeTasks: state.completeTasks,
        pendingTasks: state.pendingTasks));
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}
