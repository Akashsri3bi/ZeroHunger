import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hunger/screens/home.dart';
import 'package:hunger/screens/new_signup.dart';
import 'package:hunger/service/auth.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AuthService authService = AuthService();
  bool loadingIsVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.green,
            ),
            const TopSginin(),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.10,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.14),
                      child: Image.asset("assets/logo.png"),
                    ),
                    InputField(
                      headerText: "Email",
                      hintTexti: "email",
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InputFieldPassword(
                      headerText: "Password",
                      hintTexti: "At least 8 Charecter",
                      controller: passwordController,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CheckerBox(),
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Colors.green.withOpacity(0.7),
                                  fontWeight: FontWeight.w500,
                                fontSize: 16
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () async {
                        if (emailController.text != '' &&
                            passwordController.text != '') {
                          setState(() {
                            loadingIsVisible = true;
                          });
                        }
                        await authService
                            .signIn(
                                emailController.text, passwordController.text)
                            .then((value) {
                          setState(() {
                            loadingIsVisible = false;
                          });
                          return Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()));
                        }).catchError((err) {
                          setState(() {
                            loadingIsVisible = false;
                          });
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Wrong login credentials..",
                                  style: TextStyle(
                                    fontFamily: "helvetica",
                                    fontSize: 18
                                  )),
                                  content: Text(err.message,
                                  style: const TextStyle(
                                    fontFamily: "helvetica"
                                  )),
                                  actions: [
                                    TextButton(
                                      child: const Text("Ok",
                                        style: TextStyle(
                                          fontFamily: "helvetica"
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              }
                          );
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.07,
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: const Center(
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    loadingIsVisible
                        ?
                    Center(
                      child: Column(
                        children: const <Widget>[
                          SizedBox(
                            height: 3,
                          ),
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator(
                              strokeWidth: 5,
                            ),
                          ),

                        ],
                      ),
                    )
                        : Container(),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Text.rich(
                        TextSpan(
                            text: "Don't already Have an account? ",
                            style: TextStyle(
                                color: Colors.grey.withOpacity(0.8),
                                fontSize: 19),
                            children: [
                              TextSpan(
                                  text: "Sign Up",
                                  style: const TextStyle(
                                      color: Colors.green, fontSize: 19),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignUp()));
                                    }),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class CheckerBox extends StatefulWidget {
  const CheckerBox({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckerBox> createState() => _CheckerBoxState();
}

class _CheckerBoxState extends State<CheckerBox> {
  bool? isCheck;
  @override
  void initState() {
    isCheck = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
              value: isCheck,
              checkColor: Colors.white, // color of tick Mark
              activeColor: Colors.green,
              onChanged: (val) {
                setState(() {
                  isCheck = val!;
                });
              }),
          Text.rich(
            TextSpan(
              text: "Remember me",
              style:
                  TextStyle(color: Colors.grey.withOpacity(0.8), fontSize: 19),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class InputField extends StatelessWidget {
  String headerText;
  String hintTexti;
  TextEditingController controller;
  InputField(
      {Key? key,
      required this.headerText,
      required this.hintTexti,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: Text(
            headerText,
            style: const TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextField(
                controller: controller,
                style: const TextStyle(
                  fontFamily: "helvetica",
                ),
                decoration: InputDecoration(
                  hintText: hintTexti,
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            )
            //IntrinsicHeight

            ),
      ],
    );
  }
}

class InputFieldPassword extends StatefulWidget {
  String headerText;
  String hintTexti;
  TextEditingController controller;

  InputFieldPassword(
      {Key? key,
      required this.headerText,
      required this.hintTexti,
      required this.controller})
      : super(key: key);

  @override
  State<InputFieldPassword> createState() => _InputFieldPasswordState();
}

class _InputFieldPasswordState extends State<InputFieldPassword> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: Text(
            widget.headerText,
            style: const TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              controller: widget.controller,
              obscureText: _visible,
              style: const TextStyle(
                fontFamily: "helvetica",
              ),
              decoration: InputDecoration(
                  hintText: widget.hintTexti,
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                      icon: Icon(
                          _visible ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _visible = !_visible;
                        });
                      })),
            ),
          ),
        ),
      ],
    );
  }
}

class TopSginin extends StatelessWidget {
  const TopSginin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 27, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            width: 15,
          ),
          Text(
            "Sign In",
            style: TextStyle(color: Colors.white, fontSize: 25),
          )
        ],
      ),
    );
  }
}
