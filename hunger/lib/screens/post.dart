import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final User? currentUser = auth.currentUser;
late File? file;
String photoUrl = currentUser!.photoURL!;

class Post extends StatefulWidget {
  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool changed = false;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Create Post',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          actions: [ InkWell(
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
            ),
          ],
        ),
        body: ListView(
          children: <Widget> [
            Visibility( //this is the area to display image
              child: Container(
                height: 220,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 16/9,
                    child: Container(
                      decoration: BoxDecoration(
                        //image: DecorationImage(
                        //  fit: BoxFit.cover,
                        //  image: FileImage(file!),
                        //)
                      ),
                    ),
                  ),
                ),
              ),
              visible: true,//doesImageExist(), //display it if there is an image
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
              child: Expanded(
                child: Column(
                  children: [
                    ListTile(
                      title: Container(
                        width: 250.0,
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: "Write a title..",
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontFamily: "helvetica",
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ), const Divider(),
                    const ListTile(
                      title: TextField(
                        decoration: InputDecoration(
                          hintText: "Write something...",
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontFamily: "helvetica",
                          fontSize: 19,
                        ),
                        maxLines: null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        //bottomNavigationBar: BottomNavigationBar(
        //  items: const <BottomNavigationBarItem>[
        //    BottomNavigationBarItem(
        //      icon: Icon(Icons.camera_alt),
        //      label: 'Add photo',
        //    ),
        //  ],
        //  currentIndex: selectedIndex,
        //  onTap: goToSelectImage,
        //),
      ),
    );
  }
 //void goToSelectImage(int index) {}

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
              onPressed: takePhoto(),
            ),
            SimpleDialogOption(
              child: const Text("Select from Gallery",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "helvetica",
                ),
              ),
              onPressed: chooseFromGallery(),
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
  chooseFromGallery() async {
    Navigator.pop(context);
    dynamic _file = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      file = _file;
    });
  }
  takePhoto() async {
    Navigator.pop(context);
    dynamic _file = await ImagePicker().pickImage(
        source: ImageSource.camera, maxHeight: 67500, maxWidth: 96000);
    setState(() {
      file = _file;
    });
  }
  bool doesImageExist(){
    if(file == null) {
        return false;
    }
    else {
      return true;
    }
  }
}
