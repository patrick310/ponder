import 'package:flutter/material.dart';
import 'project_view.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Ponder: Easy Vision Systems',
    theme: new ThemeData(primarySwatch: Colors.blue),
    home: new ProjectsPage(),
    routes: <String, WidgetBuilder>{
      '/projects': (BuildContext context) => new ProjectsPage(),
    },
  ));
}
