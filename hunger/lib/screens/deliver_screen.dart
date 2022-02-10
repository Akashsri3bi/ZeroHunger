import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeliverScreen extends StatelessWidget {
  final String location;

  const DeliverScreen({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Text(location.isNotEmpty ? location : "Enter one location first"),
    );
  }
}
