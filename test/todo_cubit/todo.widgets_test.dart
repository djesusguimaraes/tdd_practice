import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_practice/app.dart';
import 'package:tdd_practice/todo/todo_list.widget.dart';

import '../finder_extensions.dart';

Future<void> _addTask(WidgetTester widgetTester) async {
  await widgetTester.pumpWidget(const App());

  await widgetTester.tap(find.text('Todo'));
  await widgetTester.pumpAndSettle();

  final textFieldFinder = find.byType(TextField);
  final buttonFinder = find.byType(TextButton);

  expect(textFieldFinder, findsOneWidget);
  expect(buttonFinder, findsOneWidget);
  expect(find.byType(TaskCell), findsNothing);

  await widgetTester.enterText(textFieldFinder, "First task");
  await widgetTester.tap(find.text("Add"));

  await widgetTester.pumpAndSettle();
  expect(find.byType(TaskCell), findsOneWidget);
}

void main() {
  testWidgets(
    'Find a [TextField] enter text in it, and find a button with text \'Add\','
    ' and then tap it to find a new TaskCell created.',
    _addTask,
  );

  testWidgets(
    'Find a [TextField], enter text in it, and find a button with text \'Add\','
    'and then tap it to find a new [TaskCell], and then tap it to test if the [TextField] has been cleaned',
    (widgetTester) async {
      await _addTask(widgetTester);

      final textFieldFinder = find.byType(TextField);

      expect(textFieldFinder.accessFirstWidgetAs<TextField>().controller?.text ?? 'Not Empty', "");
    },
  );

  testWidgets(
    'Find a [TextField] enter text in it, and find a button with text \'Add\','
    ' and then tap it to find a new TaskCell created, and then tap it to complete it.',
    (widgetTester) async {
      await _addTask(widgetTester);

      await widgetTester.tap(find.byType(TaskCell));
      await widgetTester.pumpAndSettle();

      final taskCellFinder = find.byType(TaskCell);

      expect(taskCellFinder, findsOneWidget);
      expect(taskCellFinder.accessFirstWidgetAs<TaskCell>().task.isDone, true);
    },
  );

  testWidgets(
    'Find a [TextField] enter text in it, and find a button with text \'Add\','
    ' and then tap it to find a new TaskCell created,'
    ' and then longPress it to delete it.',
    (widgetTester) async {
      await _addTask(widgetTester);

      await widgetTester.longPress(find.byType(TaskCell));

      await widgetTester.pumpAndSettle();

      expect(find.byType(TaskCell), findsNothing);
    },
  );
}
