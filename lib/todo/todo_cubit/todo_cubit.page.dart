import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_practice/domain/models/task.model.dart';
import 'package:tdd_practice/todo/todo_list.widget.dart';

import 'cubit/todo.cubit.dart';

class TodoCubitPage extends StatelessWidget {
  const TodoCubitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoCubit(),
      child: BlocBuilder<TodoCubit, TodoState>(builder: (context, state) {
        resolveTodoList() {
          final state = context.watch<TodoCubit>().state;
          if (state is TaskUpdated) {
            return state.tasks;
          }
          return <Task>[];
        }

        final todoCubit = context.read<TodoCubit>();

        return TodoListWidget(
          tasks: resolveTodoList(),
          onAddTask: (task) => todoCubit.addTask(task),
          onTaskDeleted: (task) => todoCubit.deleteTask(task),
          onTaskCompleted: (task) => todoCubit.completeTask(task),
        );
      }),
    );
  }
}
