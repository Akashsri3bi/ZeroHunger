import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool changed = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Share Post',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          actions: [
            InkWell(
              onTap: () {
                if (changed) {
                  //Code to be executed if there is some material post .
                }
              },
              splashColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.send,
                  color: changed ? Colors.green : Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
