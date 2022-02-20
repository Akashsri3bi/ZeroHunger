import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

class Inform extends StatefulWidget {
  const Inform({Key? key}) : super(key: key);

  @override
  _InformState createState() => _InformState();
}

class _InformState extends State<Inform> {
  XFile? file;
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
      body: Scaffold(
        body: Container(),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            selectImage(context);
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.lightGreen[700],
        ),
      ),
    );
  }

  selectImage(parentContext) {
    return showDialog(
        context: parentContext,
        builder: (dialogContext) {
          return SimpleDialog(
            title: Text("Choose photo"),
            children: <Widget>[
              SimpleDialogOption(
                child: Text("Capture with Camera"),
                onPressed: takePhoto,
              ),
              SimpleDialogOption(
                child: Text("Select from Gallery"),
                onPressed: chooseFromGallery,
              ),
              SimpleDialogOption(
                child: Text("Cancel"),
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
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      this.file = file;
    });
  }

  takePhoto() async {
    Navigator.pop(context);
    XFile? file = await ImagePicker().pickImage(
        source: ImageSource.camera, maxHeight: 67500, maxWidth: 96000);
    setState(() {
      this.file = file;
    });
  }
}
