import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_practice/domain/models/task.model.dart';
import 'package:tdd_practice/todo/todo_cubit/cubit/todo.cubit.dart';

void main() {
  group("BLoC tests for the task cubit.", () {
    const task = Task(text: "First task", isDone: false);

    blocTest<TodoCubit, TodoState>(
      'emits [TaskUpdated] when addOneTask is called.',
      seed: () => TaskInitial(),
      build: () => TodoCubit(),
      act: (cubit) => cubit.addTask(task),
      expect: () => <TodoState>[
        const TaskUpdated(tasks: <Task>[task])
      ],
    );

    const secondTask = Task(text: "Second task", isDone: false);

    blocTest<TodoCubit, TodoState>(
      'given a TaskUpdated with one task, emits [TaskUpdated] when addOneTask is called.',
      seed: () => const TaskUpdated(tasks: [task]),
      build: () => TodoCubit(),
      act: (cubit) => cubit.addTask(secondTask),
      expect: () => <TodoState>[
        const TaskUpdated(tasks: [task, secondTask])
      ],
    );

    blocTest<TodoCubit, TodoState>(
      'emits [TaskUpdated] when completeTask is added',
      build: () => TodoCubit(),
      seed: () => const TaskUpdated(tasks: [Task(text: "1"), Task(text: "2")]),
      act: (cubit) => cubit.completeTask(const Task(text: "1")),
      expect: () => const <TodoState>[
        TaskUpdated(tasks: [Task(text: "1", isDone: true), Task(text: "2")])
      ],
    );

    blocTest<TodoCubit, TodoState>(
      'Given a [TaskInitial], emits [] when completeTask is added',
      seed: () => TaskInitial(),
      build: () => TodoCubit(),
      act: (cubit) => cubit.completeTask(const Task(text: "1")),
      expect: () => const <TodoState>[],
    );

    blocTest<TodoCubit, TodoState>(
      'Given a TaskUpdated with 0 task, emits [] when completeOneTask is added.',
      seed: () => const TaskUpdated(tasks: []),
      build: () => TodoCubit(),
      act: (cubit) => cubit.completeTask(const Task(text: "2")),
      expect: () => <TodoState>[],
    );

    blocTest<TodoCubit, TodoState>(
      'Given a TaskUpdated with 3 tasks, emits [TaskUpdated] when deleteOneTask is called, with a task contained in the list.',
      seed: () => const TaskUpdated(tasks: [Task(text: "1"), Task(text: "2"), Task(text: "3")]),
      build: () => TodoCubit(),
      act: (cubit) => cubit.deleteTask(const Task(text: "1")),
      expect: () => <TodoState>[
        const TaskUpdated(tasks: [Task(text: "2"), Task(text: "3")])
      ],
    );

    blocTest<TodoCubit, TodoState>(
      'Given a TaskInitial, emits [TaskUpdated] when deleteTask is called.',
      seed: () => TaskInitial(),
      build: () => TodoCubit(),
      act: (cubit) => cubit.deleteTask(const Task(text: "1")),
      expect: () => <TodoState>[],
    );

    blocTest<TodoCubit, TodoState>(
      'Given a TaskUpdated with 3 tasks, emits [TaskUpdated] when deleteTask is called, with a task is NOT contained in the list.',
      seed: () => const TaskUpdated(tasks: [Task(text: "0"), Task(text: "2"), Task(text: "3")]),
      build: () => TodoCubit(),
      act: (cubit) => cubit.deleteTask(const Task(text: "1")),
      expect: () => <TodoState>[],
    );
  });
}
