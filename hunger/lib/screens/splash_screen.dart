import 'package:flutter/material.dart';
import 'package:hunger/screens/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      const Padding(
        padding: EdgeInsets.only(left: 50, top: 250, right: 90),
        child: Text(
          'Hungry',
          style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/logo.png')),
            ),
          ),
        ),
      ),
    ]));
  }
}
