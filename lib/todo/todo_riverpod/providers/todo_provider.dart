import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tdd_practice/domain/models/task.model.dart';

part 'todo_provider.g.dart';

@riverpod
class Todo extends _$Todo {
  @override
  List<Task> build() => <Task>[];

  addTask(Task task) => state = [...state, task];

  deleteTask(Task task) => state = state.where((t) => t != task).toList();

  completeTask(Task task) => state = state.map((t) => t == task ? t.copyWith(isDone: true) : t).toList();
}
