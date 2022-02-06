import 'package:flutter/material.dart';
import 'package:hunger/config/theme.dart';
import 'package:hunger/screens/home.dart';
import 'package:hunger/screens/splashScreen.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Login();
  }
}

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsetsDirectional.fromSTEB(0,100,0,0),
            child: const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                )
            )
          ),
        Container( // TEXT
          padding: const EdgeInsetsDirectional.fromSTEB(30,40,30,15),
          child: Stack(
            children: <Widget>[
              Container(
                  child: const Text(
                      "Login, please",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      )
                  )
              ),
            ],
          ),
        ),
        Container( // for email
          padding: const EdgeInsetsDirectional.fromSTEB(45,40,45,45),
          child: Column(
            children: const <Widget>[
              TextField(
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'helvetica'
                ),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                    ),
                ),
              ),
            ],
          ),
        ),
        Container( // for password
          padding: const EdgeInsetsDirectional.fromSTEB(45,0,45,30),
          child: Column(
            children: const <Widget>[
              TextField(
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'helvetica'
                ),
                decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                    ),
                ),
                obscureText: true,
              ),
            ],
          ),
        ),

          //const SizedBox(height: 5.0),
        Container(
          alignment: Alignment(1.0, 0.0),
          padding: const EdgeInsetsDirectional.fromSTEB(0,0,25,0),
          child: const InkWell(
            child: Text('Forgot Password',
            style: TextStyle(
              fontSize: 15,
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontFamily: "Helvetica",
              decoration: TextDecoration.underline
            ),),
          ),
        ),],
      ),
    );
  }
}
