import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final User? currentUser = auth.currentUser;
File? file = null;
String photoUrl = currentUser!.photoURL!;

class Post extends StatefulWidget {
  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool changed = false;
  int selectedIndex = 0;
  TextEditingController controller = TextEditingController();
  @override
  @protected
  // ignore: must_call_super
  void dispose() {
    file = null;
    super.dispose();
  }

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
          actions: [
            InkWell(
              onTap: () {
                if (changed) {
                  //Code to be executed if there is some material post .
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Posting...'),
                    behavior: SnackBarBehavior.floating,
                  ));
                  //Code for the image and text to be sent to firebase
                  String text = controller.text;
                  if (file != null) {}
                  Navigator.pop(context);
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
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 80,
            color: Colors.white,
            width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Header layout ,
                  Container(
                      padding: const EdgeInsets.all(8.0),
                      height: 70,
                      width: double.infinity,
                      child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    height: 55,
                                    width: 56,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/person1.jpg'),
                                            fit: BoxFit.fill),
                                        shape: BoxShape.circle)),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        'Akash Srivastava',
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ),
                              ]))),

                  file == null
                      ? Expanded(
                          child: TextField(
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                setState(() {
                                  changed = true;
                                });
                              }

                              if (value.isEmpty) {
                                setState(() {
                                  changed = false;
                                });
                              }
                            },
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                            ),
                            expands: true,
                            minLines: null,
                            maxLines: null,
                            controller: controller,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintStyle: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 20,
                              ),
                              border: InputBorder.none,
                              hintText: "Share Your Contribution Here !",
                              contentPadding: EdgeInsets.only(
                                  left: 20.0, bottom: 5.0, top: 12.5),
                            ),
                          ),
                        )
                      : Container(
                          height: 500,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 60,
                                child: TextField(
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      if (mounted) {
                                        setState(() {
                                          changed = true;
                                        });
                                      }
                                    }

                                    if (value.isEmpty) {
                                      if (mounted) {
                                        setState(() {
                                          changed = false;
                                        });
                                      }
                                    }
                                  },
                                  style: const TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 20,
                                  ),
                                  expands: true,
                                  minLines: null,
                                  maxLines: null,
                                  controller: controller,
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintStyle: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                    ),
                                    border: InputBorder.none,
                                    hintText: "Share Your Contribution Here !",
                                    contentPadding: EdgeInsets.only(
                                        left: 20.0, bottom: 5.0, top: 12.5),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 2),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                height: 250,
                                width: double.infinity - 40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(file!),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                  const SizedBox(
                    height: 5,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        InkWell(
                            onTap: () {
                              takePhoto();
                            },
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey[700],
                              size: 30,
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                            onTap: () {
                              chooseFromGallery();
                            },
                            child: Icon(
                              Icons.image,
                              color: Colors.grey[700],
                              size: 30,
                            )),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
  //void goToSelectImage(int index) {}

  /*
  selectImage(parentContext) {
    return showDialog(
        context: parentContext,
        builder: (dialogContext) {
          return SimpleDialog(
            title: const Text(
              "Choose Photo",
              style: TextStyle(fontSize: 19, fontFamily: "helvetica"),
              textAlign: TextAlign.center,
            ),
            children: <Widget>[
              SimpleDialogOption(
                child: const Text(
                  "Capture with Camera",
                  style: TextStyle(fontSize: 18, fontFamily: "helvetica"),
                ),
                onPressed: takePhoto(),
              ),
              SimpleDialogOption(
                child: const Text(
                  "Select from Gallery",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "helvetica",
                  ),
                ),
                onPressed: chooseFromGallery(),
              ),
              SimpleDialogOption(
                child: const Text(
                  "Cancel",
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
  */

  chooseFromGallery() async {
    XFile? _file = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(_file!.path);
    });
  }

  takePhoto() async {
    XFile? _file = await ImagePicker().pickImage(
        source: ImageSource.camera, maxHeight: 67500, maxWidth: 96000);
    setState(() {
      file = File(_file!.path);
    });
  }

  bool doesImageExist() {
    if (file == null) {
      return false;
    } else {
      return true;
    }
  }
}
