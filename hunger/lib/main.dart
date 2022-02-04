import 'package:flutter/material.dart';
import 'package:hunger/config/theme.dart';
import 'package:hunger/screens/home.dart';
import 'package:hunger/screens/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hunger',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}
