import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      body: Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          PostingPage();
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.lightGreen[700],
      ),
    );
  }
  selectImage(parentContext){
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
        }
    );
  }
  chooseFromGallery() async{
    Navigator.pop(context);
    dynamic file = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      file = file;
    });
  }
  takePhoto() async{
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
