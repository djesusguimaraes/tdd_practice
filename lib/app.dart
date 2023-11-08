import 'package:flutter/material.dart';
import 'package:tdd_practice/todo/todo_cubit/todo_cubit.page.dart';
import 'package:tdd_practice/todo/todo_riverpod/todo_riverpod.page.dart';

import 'app_routes.dart';
import 'home.page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        AppRoutes.home: (_) => const HomePage(),
        AppRoutes.todoCubit: (_) => const TodoCubitPage(),
        AppRoutes.todoRiverpod: (_) => const TodoRivepodPage(),
      },
      title: 'TDD Practice',
      home: const HomePage(),
    );
  }
}
