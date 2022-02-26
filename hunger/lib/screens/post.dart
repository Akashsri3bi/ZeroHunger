import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
File? file;
final User? currentUser = auth.currentUser;
String photoUrl = currentUser!.photoURL!;
bool fileChosen = false;
final userRef = FirebaseFirestore.instance.collection("Person");
final postRef = FirebaseFirestore.instance.collection("Post");

class Post extends StatefulWidget {
  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  File otherFile = File("file.txt");
  bool isUploading = false;
  int selectedIndex = 0;
  TextEditingController textTitle = TextEditingController();
  TextEditingController textDetailed = TextEditingController();

  @override
  Widget build(BuildContext context) {
    makeAnotherFile();
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
              onTap: () => isUploading ? null : () => handleSubmit(),
              splashColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.send,
                  color: isUploading ? Colors.green : Colors.grey,
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          children: <Widget> [
            isUploading ? LinearProgressIndicator() : Text(""),
            //remove this part and connect posting with firebase (with only the texts data)

            //Visibility(
            //  //this is the area to display image
            //  child: Container(
            //    height: 220,
            //    width: MediaQuery.of(context).size.width * 0.8,
            //    child: Center(
            //      child: AspectRatio(
            //        aspectRatio: 16/9,
            //        child: Container(
            //          decoration: BoxDecoration(
            //            image: DecorationImage(
            //              fit: BoxFit.cover,
            //              image: FileImage(displayImage()!),
            //            )
            //          ),
            //        ),
            //      ),
            //    ),
            //  ),
            //  visible: doesImageExist(), //display it if there is an image
            //  //todo: BUG it does not display when an image was chosen
            //),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
              child: Expanded(
                child: Column(
                  children: [
                    ListTile(
                      title: Container(
                        width: 250.0,
                        child: TextField(
                          controller: textTitle,
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
                    ListTile(
                      title: TextField(
                        controller: textDetailed,
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
        bottomNavigationBar: Container(
          alignment: Alignment.center,
          height: 64,
          width: 80,
          color: Colors.grey[200],
          child: InkWell(
            onTap: () {
              setState(() {
                selectImage(context);
              });
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Column(
                children: const <Widget>[
                  Icon(
                    Icons.camera_alt,
                    color: Colors.blueGrey,
                  ),
                  Text('Add Photo',
                    style: TextStyle(
                        fontFamily: "helvetica",
                        fontSize: 15
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  File? displayImage(){
    if(file == null){
      //makeAnotherFile();
      return otherFile;
    }
    else{
      return file;
    }
  }

  createPostInFirestore(String _textTitle, String _textDetailed){
    //postRef.doc(currentUser.uid).collection("userPosts").doc(postId)
    //    .set({
    //  "postId" : postId,
    //  "ownerId" : currentUser.uid,
    //  "title" : _textTitle,
    //  "detailedText": _textDetailed,
    //});
  }

  void handleSubmit() async{
    setState(() {
      isUploading = true;
    });
    // uploading photo can be handled here
    createPostInFirestore(
      textTitle.text,
      textDetailed.text,
    );

  }
  void makeAnotherFile() async {
    otherFile = await getImageFileFromAssets('assets/blank_image.png');
  }
  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');

    final _file = File('${(await getTemporaryDirectory()).path}/$path');
    await _file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return _file;
  }
  selectImage(parentContext) { //todo: BUG it opens first dialog option instead of opening the dialogBox
    return showDialog(
      context: parentContext,
      builder: (parentContext) {
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
              child: const Text("Select from Gallery",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "helvetica",
                ),
              ),
              onPressed: chooseFromGallery(),
            ),
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
      fileChosen = true;
    });
  }
  takePhoto() async {
    Navigator.pop(context);
    dynamic _file = await ImagePicker().pickImage(
        source: ImageSource.camera, maxHeight: 67500, maxWidth: 96000);
    setState(() {
      file = _file;
      fileChosen = true;
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
