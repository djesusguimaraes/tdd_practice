import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lage_score/app/modules/draft/draft_module.dart';
import 'package:lage_score/app/modules/home/home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  List<Widget> caching = List.generate(10, (index) {
    int color;
    if (index == 0) {
      color = 50;
    } else {
      color = index * 100;
    }
    return Container(
      child: Text('Partida $index'),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.lightBlue[color]),
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Corno'),
      ),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const SliverAppBar(
              title: Text('LageScore'),
              centerTitle: true,
              floating: true,
            ),
          ];
        },
        body: Observer(
          builder: (_) {
            return SingleChildScrollView(child: Column(children: caching));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_circle_outline_rounded),
        onPressed: () => Modular.to.navigate(DraftModule.routeName),
      ),
    );
  }
}
