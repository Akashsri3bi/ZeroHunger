import 'package:flutter/material.dart';
import 'package:hunger/config/theme.dart';
import 'package:hunger/screens/home.dart';
import 'package:hunger/screens/splash_screen.dart';

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
          padding: const EdgeInsetsDirectional.fromSTEB(45,40,45,27),
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
          padding: const EdgeInsetsDirectional.fromSTEB(45,0,45,28),
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
          alignment: const Alignment(1.0, 0.0),
          padding: const EdgeInsetsDirectional.fromSTEB(0,0,25,13),
          child: const InkWell(
            child: Text(
              'Forgot Password',
            style: TextStyle(
              fontSize: 15,
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontFamily: "Helvetica",
              decoration: TextDecoration.underline
            ),),
          ),
        ),
        const SizedBox(height: 30.0),
          Container(
            padding: const EdgeInsetsDirectional.fromSTEB(45, 0, 45, 0 ),
            height: 42,
            child: Material(
              borderRadius: BorderRadius.circular(20),
              shadowColor: Colors.greenAccent,
              color: Colors.green[600],
              elevation: 5,
              child: GestureDetector(
                onTap: () {},
                child: const Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Helvetica'
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Container(
            padding: const EdgeInsetsDirectional.fromSTEB(45, 0, 45, 0),
            height: 42,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                ),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget> [
                  SizedBox(width: 10),
                  Center(
                    child: Text(
                      'Login with Google',
                      style: TextStyle(
                        fontFamily: 'helvetica',
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 45),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                  'New here ?',
                style: TextStyle(
                  fontFamily: 'Helvetica',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8),
              InkWell(
                child: Text('Signup',
                  style: TextStyle(
                    color: Colors.green,
                    fontFamily: 'helvetica',
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    fontSize: 17,
                  ),
                )
              ),
            ],
          )
        ],
      ),

    );
  }
}
