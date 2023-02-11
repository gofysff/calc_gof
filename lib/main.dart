import 'package:calc_gof/logic/storage_results.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => StorageResults(),
          child: const HomePage(),
        ),
        backgroundColor: kBackgroundColor,
      ),
    );
  }
}
