import 'package:flutter/material.dart';
import 'package:hunger/config/theme.dart';
import 'package:hunger/screens/home.dart';
import 'package:hunger/screens/splash_screen.dart';
import 'package:hunger/screens/login.dart';
import 'package:hunger/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: Login(),
    );
  }
}
