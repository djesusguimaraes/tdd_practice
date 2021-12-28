import 'package:flutter_modular/flutter_modular.dart';
import 'package:lage_score/app/modules/draft/draft_page.dart';

class DraftModule extends Module {
  static String get routeName => '/draft';
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const DraftPage()),
  ];
}
