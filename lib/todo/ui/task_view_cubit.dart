import 'package:bloc_cubit_state/todo/controllers/cubit/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskViewCubit extends StatelessWidget {
  TaskViewCubit({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To Do App')),
      body: BlocProvider(
        create : (context) => TaskCubit(),
        child: BlocBuilder<TaskCubit, TaskState>(
          builder: (BuildContext context, TaskState state) {
            final taskControllerCubit = context.read<TaskCubit>();
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
                      taskControllerCubit.addTask(controller.text);
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
                          taskControllerCubit.toggleTask(state.tasks[index].id);
                        },
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          taskControllerCubit.removeTask(state.tasks[index].id);
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
