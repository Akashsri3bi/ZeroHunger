import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hunger/screens/home.dart';
import 'package:hunger/screens/new_login.dart';
import 'package:hunger/service/auth.dart';

class SignUp extends StatefulWidget {
  static String name = "";
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nameController = TextEditingController();
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
            const TopSginup(),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.10,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45))),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.8,
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.09),
                        child: Image.asset("assets/logo.png"),
                      ),
                      InputField(
                        headerText: "Username",
                        hintTexti: "Name",
                        controller: nameController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InputField(
                        headerText: "Email",
                        hintTexti: "dion@example.com",
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
                      const CheckerBox(),
                      InkWell(
                        onTap: () {
                          if (emailController.text != '' &&
                              nameController.text != '' &&
                              passwordController.text != '') {
                            setState(() {
                              loadingIsVisible = true;
                            });
                          }
                          authService
                              .register(nameController.text, "",
                              emailController.text, passwordController.text)
                              .then((value) {
                            setState(() {
                              loadingIsVisible = false;
                            });
                            SignUp.name = nameController.text;
                            return Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()));
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
                              "Sign up",
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
                          ? const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 5,
                        ),
                      )
                          : Container(),
                      Container(
                        margin: EdgeInsets.only(
                            top: 20,
                            left: MediaQuery.of(context).size.width * 0.18),
                        child: Text.rich(
                          TextSpan(
                              text: "I already Have an account ",
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(0.8),
                                  fontSize: 16),
                              children: [
                                TextSpan(
                                    text: "Sign In",
                                    style: const TextStyle(
                                        color: Colors.green, fontSize: 16),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const Signin()));
                                      }),
                              ]),
                        ),
                      ),
                    ],
                  ),
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
                text: "I agree with ",
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.8), fontSize: 16),
                children: const [
                  TextSpan(
                      text: "Terms ",
                      style: TextStyle(color: Colors.blue, fontSize: 16)),
                  TextSpan(text: "and "),
                  TextSpan(
                      text: "Policy",
                      style: TextStyle(color: Colors.blue, fontSize: 16)),
                ]),
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
      required this.controller,
      required this.hintTexti})
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
                decoration: InputDecoration(
                  hintText: hintTexti,
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                  fontFamily: "helvetica",
                ),
              ),
            )),
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
      required this.controller,
      required this.hintTexti})
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
              style: const TextStyle(
                fontFamily: "helvetica"
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TopSginup extends StatelessWidget {
  const TopSginup({
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
            "Sign up",
            style: TextStyle(color: Colors.white, fontSize: 25),
          )
        ],
      ),
    );
  }
}
