part of 'task_cubit.dart';

@immutable
sealed class TaskState extends Equatable {
  final List<TaskModel> tasks;

  const TaskState(this.tasks);

  @override
  List<Object?> get props => [tasks];
}

final class TaskInitial extends TaskState {
  TaskInitial() : super([]);
}

final class TaksUpdate extends TaskState {
  const TaksUpdate(super.tasks);
}
