import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tdd_practice/todo/todo_list.widget.dart';
import 'package:tdd_practice/todo/todo_riverpod/providers/todo_provider.dart';

class TodoRivepodPage extends StatelessWidget {
  const TodoRivepodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(builder: (context, ref, _) {
        final todo = ref.watch(todoProvider.notifier);
        return TodoListWidget(
          tasks: ref.watch(todoProvider),
          onAddTask: (task) => todo.addTask(task),
          onTaskDeleted: (task) => todo.deleteTask(task),
          onTaskCompleted: (task) => todo.completeTask(task),
        );
      }),
    );
  }
}
