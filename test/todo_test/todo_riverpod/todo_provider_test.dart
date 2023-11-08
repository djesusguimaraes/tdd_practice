import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_practice/domain/models/task.model.dart';
import 'package:tdd_practice/todo/todo_riverpod/providers/todo_provider.dart';

/// A testing utility which creates a [ProviderContainer] and automatically
/// disposes it at the end of the test.
ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  // Create a ProviderContainer, and optionally allow specifying parameters.
  final container = ProviderContainer(parent: parent, overrides: overrides, observers: observers);

  // When the test ends, dispose the container.
  addTearDown(container.dispose);

  return container;
}

Task _addTask(ProviderContainer container) {
  final tasks = container.read(todoProvider.notifier);

  const firstTask = Task(text: 'First task');

  tasks.addTask(firstTask);

  return firstTask;
}

void main() {
  test('Provider must initialize with no tasks', () {
    final container = createContainer();

    final tasks = container.read(todoProvider);

    expect(tasks, []);
  });

  test('Provider must add a task', () {
    final container = createContainer();

    final subscription = container.listen(todoProvider, (_, __) {});

    final firstTask = _addTask(container);

    expect(subscription.read(), [firstTask]);
  });

  test('Provider must delete a task', () {
    final container = createContainer();

    final subscription = container.listen(todoProvider, (_, __) {});

    final firstTask = _addTask(container);

    final tasks = container.read(todoProvider.notifier);

    tasks.deleteTask(firstTask);

    expect(subscription.read(), []);
  });

  test('Provider must complete a task', () {
    final container = createContainer();

    final subscription = container.listen(todoProvider, (_, __) {});

    final firstTask = _addTask(container);

    final tasks = container.read(todoProvider.notifier);

    tasks.completeTask(firstTask);

    expect(subscription.read(), [firstTask.copyWith(isDone: true)]);
  });
}
