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
    navigateToHome();
  }

  navigateToHome() async{
    await Future.delayed(const Duration(seconds: 2), () {} );
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB( 55,220,55,0 ),
                child: Text(
                  'End Hunger',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
              )
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB( 0,0,0,220 ),
                child: Container(
                  decoration: const  BoxDecoration(
                    image: DecorationImage(
                      image:  AssetImage(
                        'assets/logo.png'
                      )
                    )
                  ),
                ),
              )
            )
          ]
        )
      )
    );
  }
}
