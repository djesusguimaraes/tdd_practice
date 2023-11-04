import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension FinderExtension on Finder {
  Widget accessFirstWidget() => evaluate().first.widget;
  E accessFirstWidgetAs<E extends Widget>() => accessFirstWidget() as E;
}
