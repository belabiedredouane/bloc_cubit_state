import 'package:bloc_cubit_state/todo/models/task_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  addTask(String title) {
    final task = TaskModel(
      id: Uuid().v1(),
      title: title,
      isCompleted: false,
    );
    emit(TaksUpdate([...state.tasks, task]));
  }

  removeTask(String id) {
    emit(TaksUpdate(state.tasks.where((task) => task.id != id).toList()));
  }

  toggleTask(String id) {
    emit(
      TaksUpdate(
        state.tasks.map((task) {
          if (task.id == id) {
            return task.copyWith(isCompleted: !task.isCompleted);
          }
          return task;
        }).toList(),
      ),
    );
  }
}
