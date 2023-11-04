import 'package:flutter/material.dart';
import 'package:lage_score/todo_cubit/todo.page.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (_) => const HomeScreen(),
        '/todo': (_) => const TodoPage(),
      },
      title: 'Flutter Demo',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TDD Modules')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Todo'),
            onTap: () => Navigator.pushNamed(context, '/todo'),
          ),
        ],
      ),
    );
  }
}
