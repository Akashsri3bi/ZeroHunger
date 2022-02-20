import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hunger/screens/post.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marquee/marquee.dart';

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
            title: const Text("Choose photo"),
            children: <Widget>[
              SimpleDialogOption(
                child: const Text("Capture with Camera"),
                onPressed: takePhoto,
              ),
              SimpleDialogOption(
                child: const Text("Select from Gallery"),
                onPressed: chooseFromGallery,
              ),
              SimpleDialogOption(
                child: const Text("Cancel"),
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
