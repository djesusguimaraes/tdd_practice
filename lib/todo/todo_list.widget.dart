import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_practice/domain/models/task.model.dart';
import 'package:tdd_practice/todo/todo_cubit/cubit/todo.cubit.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({
    Key? key,
    required this.tasks,
    this.onAddTask,
    this.onTaskCompleted,
    this.onTaskDeleted,
  }) : super(key: key);

  final List<Task> tasks;
  final ValueChanged<Task>? onAddTask;
  final ValueChanged<Task>? onTaskCompleted;
  final ValueChanged<Task>? onTaskDeleted;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Todo')),
        body: Column(
          children: [
            AddTaskSection(onAddTask: onAddTask),
            Expanded(
              child: Builder(
                builder: (context) {
                  if (tasks.isNotEmpty) {
                    return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) => TaskCell(
                        task: tasks.elementAt(index),
                        onTaskCompleted: onTaskCompleted,
                        onTaskDeleted: onTaskDeleted,
                      ),
                    );
                  }
                  return const Center(child: Text("No tasks yet"));
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
  const TaskCell({
    Key? key,
    required this.task,
    this.onTaskCompleted,
    this.onTaskDeleted,
  }) : super(key: key);

  final Task task;
  final ValueChanged<Task>? onTaskCompleted;
  final ValueChanged<Task>? onTaskDeleted;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTaskCompleted?.call(task),
      onLongPress: () => onTaskDeleted?.call(task),
      title: Text(task.text),
    );
  }
}

class AddTaskSection extends StatelessWidget {
  AddTaskSection({Key? key, this.onAddTask}) : super(key: key);
  final ValueChanged<Task>? onAddTask;

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        suffix: TextButton(
          onPressed: () {
            onAddTask?.call(Task(text: _controller.text));
            _controller.clear();
          },
          child: const Text("Add"),
        ),
      ),
    );
  }
}
