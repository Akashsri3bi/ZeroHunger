import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hunger/screens/post.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marquee/marquee.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final User? currentUser = auth.currentUser;
File? file;
String photoUrl = currentUser!.photoURL!;

class InformPage extends StatefulWidget {
  const InformPage({Key? key}) : super(key: key);
  @override
  _InformPageState createState() => _InformPageState();
}

class _InformPageState extends State<InformPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Inform',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Stack(children: [
        Scaffold(
          body: Container(),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Post()));
              //selectImage(context);
            },
            child: const Icon(Icons.add),
            backgroundColor: Colors.lightGreen[700],
          ),
        ),
        Positioned(
            top: 10,
            child: Container(
              height: 30,
              margin: const EdgeInsets.only(left: 2, right: 2),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 60,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/news.png'),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(width: 2),
                  Container(
                    padding: const EdgeInsets.only(top: 5),
                    height: 30,
                    width: MediaQuery.of(context).size.width - 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.redAccent,
                    ),
                    child: Center(
                      child: Marquee(
                        text:
                            'We pray for rain: Ethiopia faces catastrophic hunger as cattle perish in severe'
                            '     India is ranked 101 among 116 countries in the Global Hunger Index (GHI)'
                            '     An estimated 13 million people are waking up severely hungry every day in the Horn of Africa',
                        scrollAxis: Axis.horizontal,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        crossAxisAlignment: CrossAxisAlignment.start,
                        blankSpace: 20.0,
                        velocity: 50.0,
                        pauseAfterRound: const Duration(seconds: 1),
                        showFadingOnlyWhenScrolling: true,
                        fadingEdgeStartFraction: 0.1,
                        fadingEdgeEndFraction: 0.1,
                        startPadding: 10.0,
                        accelerationDuration: const Duration(seconds: 1),
                        accelerationCurve: Curves.linear,
                        decelerationDuration: const Duration(milliseconds: 500),
                        decelerationCurve: Curves.easeOut,
                      ),
                    ),
                  ),
                ],
              ),
            ))
      ]),
    );
  }

  selectImage(parentContext) {
    return showDialog(
        context: parentContext,
        builder: (dialogContext) {
          return SimpleDialog(
            title: const Text("Choose Photo",
              style: TextStyle(
                fontSize: 19,
                fontFamily: "helvetica"
              ),
              textAlign: TextAlign.center,
            ),
            children: <Widget> [
              SimpleDialogOption(
                child: const Text("Capture with Camera",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "helvetica"
                  ),
                ),
                onPressed: takePhoto,
              ),
              SimpleDialogOption(
                child: const Text("Select from Gallery",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "helvetica",
                  ),
                ),
                onPressed: chooseFromGallery,
              ),
              SimpleDialogOption(
                child: const Text("Cancel",
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: "helvetica",
                    ),
                ),
                onPressed: () {
                  Navigator.pop(parentContext);
                },
              ),
            ],
          );
        });
  }

  chooseFromGallery() async {
    Navigator.pop(context);
    dynamic file = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      file = file;
    });
  }

  takePhoto() async {
    Navigator.pop(context);
    dynamic file = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxHeight: 67500, maxWidth: 96000);
    setState(() {
      file = file;
    });
  }
}

class PostingPage extends StatefulWidget {
  const PostingPage({Key? key}) : super(key: key);

  @override
  _PostingPageState createState() => _PostingPageState();
}

class _PostingPageState extends State<PostingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        leading: IconButton(
            icon: Icon(
                Icons.arrow_back,
                color: Colors.black),
            onPressed: clearImage
          // if there is image and user wants to go back
        ),
        title: Text("Create Post",
          style: TextStyle(
              color: Colors.black,
              fontSize: 28
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => print("pressed"),
            child: Text("POST",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 23
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget> [
          Container(
            height: 220,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Center(
              child: AspectRatio(
                aspectRatio: 16/9,
                child: Container(
                  decoration: BoxDecoration(
                      //image: DecorationImage(
                      //    fit: BoxFit.cover,
                      //    image: FileImage(file!)
                      //)
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          ListTile(
            title: Container(
              width: 250.0,
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Write a title..",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const Divider(),
          ListTile(
            title: Container(
              width: 250.0,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Write something...",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  clearImage(){
    setState(() {
      //file = null;
    });
  }
}
