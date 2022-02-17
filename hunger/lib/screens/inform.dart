import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Inform extends StatelessWidget {
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
      body: SingleChildScrollView(
          //Todo make this screen
        child: InformPage(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ImageSelection()));
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.lightGreen[700],
      ),
    );
  }
}
class InformPage extends StatefulWidget {
  const InformPage({Key? key}) : super(key: key);

  @override
  _InformPageState createState() => _InformPageState();
}

class _InformPageState extends State<InformPage> {
  @override
  Widget build(BuildContext context) {
    return Container( //shows posts that have made
      child: Column(
        children: const <Widget> [

        ],
      ),
    );
  }
}

class ImageSelection extends StatefulWidget {
  const ImageSelection({Key? key}) : super(key: key);

  @override
  _ImageSelectionState createState() => _ImageSelectionState();
}

class _ImageSelectionState extends State<ImageSelection> {
  XFile? file;
  @override
  Widget build(BuildContext context) {
    return file == null ? selectImage(context) : InformPage();//will go to posting page
  }
  selectImage(parentContext){
    return showDialog(
        context: parentContext,
        builder: (context) {
          return SimpleDialog(
            title: Text("Create Post"),
            children: <Widget> [
              SimpleDialogOption(
                child: Text("Capture Photo with Camera"),
                onPressed: takePhoto,
              ),
              SimpleDialogOption(
                child: Text("Image from Gallery"),
                onPressed: ChooseFromGallery,
              ),
              SimpleDialogOption(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context);
                  },
              ),
            ],
          );
        }
    );
  }
  ChooseFromGallery() async{
    Navigator.pop(context);
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      this.file = file;
    });
  }
  takePhoto() async{
    Navigator.pop(context);
    XFile? file = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxHeight: 675, maxWidth: 960);
    setState(() {
      this.file = file;
    });
  }
}
