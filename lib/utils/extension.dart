import 'package:flutter/material.dart';

extension Context on BuildContext {
  BuildContext get context => this;
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  Size get size => MediaQuery.of(this).size;
  double get width => size.width;
  double get height => size.height;
}
