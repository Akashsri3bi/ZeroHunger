import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hunger/screens/post.dart';
import 'package:hunger/widgets/post_card_layout.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marquee/marquee.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InformPage extends StatefulWidget {
  const InformPage({Key? key}) : super(key: key);

  @override
  _InformPageState createState() => _InformPageState();
}

class _InformPageState extends State<InformPage> {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Inform',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Stack(
        children: [
          Scaffold(
            body: Container(
                height: MediaQuery.of(context).size.height - 140,
                width: double.infinity,
                child: StreamBuilder<QuerySnapshot>(
                  stream: db.collection('UserPosts').snapshots(),
                  builder: (context, snapshots) {
                    if (!snapshots.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      //Show list View of data
                      return ListView(
                        children: snapshots.data!.docs.map((doc) {
                          return PostCardLayout(
                              name: doc.get('name'),
                              title: doc.get('title'),
                              imageUrl: doc.get('imageUrl'));
                        }).toList(),
                      );
                    }
                  },
                )), //Done
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Post()));
                //selectImage(context);
              },
              child: const Icon(Icons.add),
              backgroundColor: Theme.of(context).backgroundColor,
            ),
          ),
          Positioned(
            // for news
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
                            fontWeight: FontWeight.normal,
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
            ),
          ),
        ],
      ),
    );
  }
}
