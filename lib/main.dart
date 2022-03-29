import 'package:flutter/material.dart';
import 'package:straight_machine/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ツッコミマシーン',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}


