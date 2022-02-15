import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hunger/screens/login.dart';
import 'package:hunger/service/auth.dart';
import 'package:hunger/screens/home.dart';

class Signup extends StatefulWidget {
  static String name = '';
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthService authService = AuthService();
  bool loadingIsVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
      Container(
        padding: const EdgeInsets.only(top: 80),
        child: const Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Center(
            child: Text(
              "Welcome",
              style: TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 50,
        ),
        child: const Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Center(
            child: Text(
              "Signup, please",
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
        padding: const EdgeInsetsDirectional.fromSTEB(35, 35, 35, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: TextField(
                controller: nameController,
                style: const TextStyle(fontSize: 18, fontFamily: 'helvetica'),
                decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: TextField(
                controller: surnameController,
                style: const TextStyle(fontSize: 18, fontFamily: 'helvetica'),
                decoration: const InputDecoration(
                  labelText: 'Surname',
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        // email
        padding: const EdgeInsetsDirectional.fromSTEB(45, 10, 45, 15),
        child: Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: TextField(
            controller: emailController,
            style: const TextStyle(fontSize: 20, fontFamily: 'helvetica'),
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
        ),
      ),
      Container(
        // password
        padding: const EdgeInsetsDirectional.fromSTEB(45, 0, 45, 80),
        child: Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: TextField(
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
        ),
      ),
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
              onTap: () {
                if (emailController.text != '' &&
                    surnameController.text != '' &&
                    nameController.text != '' &&
                    passwordController.text != '') {
                  setState(() {
                    loadingIsVisible = true;
                  });
                }
                authService
                    .register(nameController.text, surnameController.text,
                        emailController.text, passwordController.text)
                    .then((value) {
                  setState(() {
                    loadingIsVisible = false;
                  });
                  Signup.name = nameController.text;
                  return Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                });
              },
              child: const Expanded(
                child: Text(
                  'SIGN UP',
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
      const SizedBox(
        height: 45,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Already a member ?',
            style: TextStyle(
              fontFamily: 'Helvetica',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Login',
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
        height: 15,
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
    ])));
  }
}
