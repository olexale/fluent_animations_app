import 'package:fluent_animations_app/grid_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

final appTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color.fromRGBO(25, 28, 31, 1),
    cardColor: const Color.fromRGBO(27, 31, 36, 1));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Fluent animations', theme: appTheme, home: GridPage());
}
