import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hunger/screens/home.dart';
import 'package:hunger/screens/new_login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool signedin = false;
  @override
  void initState() {
    if (FirebaseAuth.instance.currentUser != null) {
      signedin = true;
    }
    navigateToHome();
    super.initState();
  }

  navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => signedin ? const Home() : const Signin()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        const Padding(
          padding: EdgeInsets.only(top: 220, left: 50, right: 80),
          child: Text(
            'Starvelp',
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
            child: Container(
              decoration: BoxDecoration(
                image:
                    const DecorationImage(image: AssetImage('assets/logo.png')),
                borderRadius: BorderRadius.circular(80),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
