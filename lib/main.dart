import 'package:fluent_animations_app/grid_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Fluent animations', theme: ThemeData.dark(), home: GridPage());
}
