part of 'todo.cubit.dart';

class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object?> get props => [];
}

class TaskInitial extends TodoState {}

class TaskUpdated extends TodoState {
  final List<Task> tasks;

  const TaskUpdated({required this.tasks});

  @override
  List<Object?> get props => [...super.props, tasks];
}
