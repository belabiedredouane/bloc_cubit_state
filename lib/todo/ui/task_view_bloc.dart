import 'package:bloc_cubit_state/todo/controllers/bloc/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskViewBloc extends StatelessWidget {
  TaskViewBloc({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To Do App')),
      body: BlocProvider(
        create : (context) => TaskBloc(),
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (BuildContext context, TaskState state) {
            final taskControllerCubit = context.read<TaskBloc>();
            return Padding(
              padding: const EdgeInsetsDirectional.all(10.0),
              child: Column(
                children: [
                  TextField(
                    controller: controller,
                    decoration: const InputDecoration(hintText: 'Enter a task'),
                  ),
                  ElevatedButton(onPressed: () {
                    if (controller.text.isNotEmpty) {
                      taskControllerCubit.add(TaskAddEvent(controller.text));
                      controller.clear();
                    }
                  }, child: Text("Add Task")),
                  Expanded(
                    child: ListView.builder(
                  itemCount: state.tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        state.tasks[index].title,
                      ),
                      leading: Checkbox(
                        value: state.tasks[index].isCompleted,
                        onChanged: (value) {
                          taskControllerCubit.add(TaskToggleEvent(state.tasks[index].id));
                        },
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          taskControllerCubit.add(TaskRemoveEvent(state.tasks[index].id));
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    );
                  },
                ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
