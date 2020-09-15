import 'package:aquadoro/aquadoro.dart';
import 'package:aquadoro/goals_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: {
        'goalsPage': (BuildContext context) => GoalsPage(),
        'aquadoro': (BuildContext context) => Aquadoro(),
      },
      initialRoute: 'goalsPage',
    );
  }
}
