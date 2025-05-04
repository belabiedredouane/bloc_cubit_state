part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

final class TaskAddEvent extends TaskEvent {
  final String title;

  const TaskAddEvent(this.title);
}

final class TaskRemoveEvent extends TaskEvent {
  final String id;

  const TaskRemoveEvent(this.id);
}

final class TaskToggleEvent extends TaskEvent {
  final String id;

  const TaskToggleEvent(this.id);
}
