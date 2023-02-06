import 'package:flutter/material.dart';
import 'constants/constant_colors.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: HomePage(),
        backgroundColor: kBackgroundColor,
      ),
    );
  }
}
