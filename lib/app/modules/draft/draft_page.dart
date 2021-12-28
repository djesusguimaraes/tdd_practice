import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';

class DraftPage extends StatefulWidget {
  const DraftPage({Key? key}) : super(key: key);

  @override
  _DraftPageState createState() => _DraftPageState();
}

class _DraftPageState extends State<DraftPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: const Text('Voltar'),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
