import 'package:flutter/material.dart';

class User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AKASH',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}
