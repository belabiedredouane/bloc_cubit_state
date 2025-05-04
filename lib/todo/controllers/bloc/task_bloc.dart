import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../models/task_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<TaskAddEvent>(_addTask);
    on<TaskRemoveEvent>(_removeTask);
    on<TaskToggleEvent>(_toggleTask);
  }

  FutureOr<void> _addTask(event, emit) {
    final task = TaskModel(
      id: Uuid().v1(),
      title: event.title,
      isCompleted: false,
    );
    emit(TaksUpdate([...state.tasks, task]));
  }

  FutureOr<void> _removeTask(TaskRemoveEvent event, Emitter<TaskState> emit) {
    emit(TaksUpdate(state.tasks.where((task) => task.id != event.id).toList()));
  }

  FutureOr<void> _toggleTask(TaskToggleEvent event, Emitter<TaskState> emit) {
    emit(
      TaksUpdate(
        state.tasks.map((task) {
          if (task.id == event.id) {
            return task.copyWith(isCompleted: !task.isCompleted);
          }
          return task;
        }).toList(),
      ),
    );
  }
}
