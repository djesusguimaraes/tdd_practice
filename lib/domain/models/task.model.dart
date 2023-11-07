import 'package:equatable/equatable.dart';

/// A simple todo element with text description and completion status.
class Task extends Equatable {
  /// The text describing the task.
  final String text;

  /// If the task is done or not. The task may be deleted if it is done.
  final bool? isDone;

  /// Creates a [Task] with the given [text] and [isDone] status.
  const Task({required this.text, this.isDone = false});

  @override
  List<Object?> get props => [text, isDone];

  @override
  bool? get stringify => true;

  /// Returns a new [Task] with updated properties.
  Task copyWith({String? text, bool? isDone}) => Task(text: text ?? this.text, isDone: isDone ?? this.isDone);
}
