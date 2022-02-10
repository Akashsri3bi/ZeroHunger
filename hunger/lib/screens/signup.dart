import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunger/screens/login.dart';
import 'package:hunger/service/auth.dart';
import 'package:hunger/screens/home.dart';


class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.only(top: 80),
                      child: const Center(
                        child: Text("Welcome",
                            style: TextStyle(
                              fontSize: 55,
                              fontWeight: FontWeight.bold,
                            ),),
                      ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 50,
                    ),
                    child: const Center(
                      child: Text("Signup, please",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.fromSTEB( 35,35,35,10 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: SizedBox(
                            width: 157,
                            child: TextField(
                              controller: nameController,
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'helvetica'
                              ),
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
                            ),),
                          ),
                        ),

                        Container(
                          //padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: SizedBox(
                            width: 168,
                            child: TextField(
                              controller: surnameController,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'helvetica'
                              ),
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
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.fromSTEB(45, 10, 45, 15),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: emailController,
                          style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'helvetica'
                          ),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(45, 0, 45, 80),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(45, 0, 45, 0),
                    height: 42,
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green[600],
                      elevation: 5,
                      child: GestureDetector(
                        onTap: () {
                          authService
                              .register(
                              nameController.text,
                              surnameController.text,
                              emailController.text,
                              passwordController.text).then((value) {
                            return Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          });
                        },
                        child: const Center(
                          child: Text(
                            'SIGN UP',
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
                ]
            )
        )
    );
  }
}