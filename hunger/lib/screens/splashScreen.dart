import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:hunger/screens/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    NavigateToHome();
  }

  NavigateToHome() async{
    await Future.delayed(const Duration(milliseconds: 1500), () {} );
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [ // logo can be put here instead of text
            Text(
              'Splash screen',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )
          ],
        ),
      )
    );
  }

}
