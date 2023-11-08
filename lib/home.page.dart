import 'package:flutter/material.dart';

import 'app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TDD Modules')),
      body: ListView(children: [
        ListTile(
          title: const Text('Todo'),
          onTap: () => Navigator.pushNamed(context, AppRoutes.todoCubit),
        ),
        ListTile(
          title: const Text('Todo Riverpod'),
          onTap: () => Navigator.pushNamed(context, AppRoutes.todoRiverpod),
        ),
      ]),
    );
  }
}
