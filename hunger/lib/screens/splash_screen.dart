import 'package:flutter/material.dart';
import 'package:hunger/screens/home.dart';
import 'package:hunger/screens/login.dart';

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
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xffffffcc),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 125, 0, 50),
              child: Text(
                'End Hunger',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffffffcc),
                    image: const DecorationImage(
                        image: AssetImage('assets/logo.png')
                    ),
                    borderRadius: BorderRadius.circular(80),
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }
}
