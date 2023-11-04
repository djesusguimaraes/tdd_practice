import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/todo.cubit.dart';
import 'models/task.model.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Todo')),
        body: Column(
          children: [
            AddTaskSection(),
            Expanded(
              child: BlocBuilder<TodoCubit, TodoState>(
                builder: (context, state) {
                  if (state is TaskUpdated) {
                    return ListView.builder(
                      itemCount: state.tasks.length,
                      itemBuilder: (context, index) => TaskCell(task: state.tasks.elementAt(index)),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskCell extends StatelessWidget {
  const TaskCell({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.read<TodoCubit>().completeTask(task),
      onLongPress: () => context.read<TodoCubit>().deleteTask(task),
      title: Text(task.text),
    );
  }
}

class AddTaskSection extends StatelessWidget {
  AddTaskSection({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        suffix: TextButton(
          onPressed: () {
            context.read<TodoCubit>().addTask(Task(text: _controller.text));
            _controller.clear();
          },
          child: const Text("Add"),
        ),
      ),
    );
  }
}
