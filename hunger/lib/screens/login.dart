import 'package:flutter/material.dart';
import 'package:hunger/screens/home.dart';
import 'package:hunger/screens/signup.dart';
import 'package:hunger/service/auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthService authService = AuthService();
  bool loadingIsVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 80),
              child: const Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Center(
                  child: Text("Welcome",
                      style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20
              ),
              child: Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  child: const Text("Login, please",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              // for email
              padding: const EdgeInsetsDirectional.fromSTEB(45, 40, 45, 27),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: emailController,
                    style: const TextStyle(fontSize: 21, fontFamily: 'helvetica'),
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey),
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
            Container(
              // for password
              padding: const EdgeInsetsDirectional.fromSTEB(45, 0, 45, 28),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: passwordController,
                    style: const TextStyle(fontSize: 21, fontFamily: 'helvetica'),
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey),
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
            Container(
              alignment: const Alignment(1.0, 0.0),
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 25, 13),
              child: const InkWell(
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Helvetica",
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Container(
              height: 42,
              width: 320,
              child: Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  shadowColor: Colors.greenAccent,
                  color: Colors.green[600],
                  elevation: 5,
                  child: GestureDetector(
                    onTap: () async {
                      if (emailController.text != '' &&
                          passwordController.text != '' )
                      {
                        setState(() {
                          loadingIsVisible = true;
                        });
                      }

                      await authService.signIn(
                          emailController.text, passwordController.text).then((value)
                      {
                        setState(() {
                          loadingIsVisible = false;
                        });
                        return Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Home()));
                      });
                    },
                    child: const Expanded(
                      child: Text(
                        'LOGIN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Helvetica'),
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
              child: Flexible(
                flex: 1,
                fit: FlexFit.tight,
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
                    children: <Widget>[
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          GoogleSignIn().signIn();
                        },
                        child: const Center(
                          child: Text(
                            'Login with Google',
                            style: TextStyle(
                                fontFamily: 'helvetica',
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 45),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'New here ?',
                  style: TextStyle(
                    fontFamily: 'Helvetica',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Signup()));
                    },
                    child: const Text(
                      'Signup',
                      style: TextStyle(
                        color: Colors.green,
                        fontFamily: 'helvetica',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        fontSize: 17,
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: Visibility(
                visible: loadingIsVisible,
                child: const CircularProgressIndicator(
                  strokeWidth: 7,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
