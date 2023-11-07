import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd_practice/domain/models/task.model.dart';

part 'todo.state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TaskInitial());

  addTask(Task task) {
    if (state is TaskInitial) {
      emit(TaskUpdated(tasks: [task]));
      return;
    }
    emit(TaskUpdated(tasks: [...(state as TaskUpdated).tasks, task]));
  }

  completeTask(Task task) {
    if (state is TaskInitial) return;
    if (state is TaskUpdated) {
      final tasks = [...(state as TaskUpdated).tasks];
      final index = tasks.indexWhere((t) => t.text == task.text);
      if (index == -1) return;
      tasks.removeAt(index);
      tasks.insert(index, task.copyWith(isDone: true));
      emit(TaskUpdated(tasks: tasks));
    }
  }

  deleteTask(Task task) {
    if (state is TaskInitial) return;
    if (state is TaskUpdated) {
      final tasks = [...(state as TaskUpdated).tasks];
      final index = tasks.indexWhere((t) => t.text == task.text);
      if (index == -1) return;
      tasks.removeAt(index);
      emit(TaskUpdated(tasks: tasks));
    }
  }
}
