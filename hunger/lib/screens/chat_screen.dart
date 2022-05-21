import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hunger/models/farmers.dart';
import 'package:hunger/widgets/post_card_layout.dart';

class ChatScreen extends StatefulWidget {
  final Farmer farmer;
  const ChatScreen({required this.farmer});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bool initialized = false;
  final db = FirebaseFirestore.instance;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        titleSpacing: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 3),
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.farmer.imageUrl),
                      fit: BoxFit.fill),
                  shape: BoxShape.circle),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.farmer.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    widget.farmer.mandi,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            alignment: Alignment.bottomRight,
            height: MediaQuery.of(context).size.height - 150,
            child: Container(
                child: StreamBuilder<QuerySnapshot>(
                    stream: db.collection(widget.farmer.name).snapshots(),
                    builder: (context, snapshots) {
                      if (!snapshots.hasData) {
                        return Container(
                          //Changes needed here || TODO
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(23),
                              color: Colors.green),
                          child: Text(
                            'no status',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.white),
                          ),
                        );
                      } else {
                        //Show list View of data
                        return ListView(
                          children: snapshots.data!.docs.map((doc) {
                            return Container(
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(23),
                                  color: Colors.green.withOpacity(0.5)),
                              child: Text(
                                doc.get('title'),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: Colors.white),
                              ),
                            );
                          }).toList(),
                        );
                      }
                    })),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity - 50,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      if (controller.text.isNotEmpty) {
                        makemessage(widget.farmer.name, widget.farmer.name,
                            controller.text);
                      }
                      setState(() {
                        controller.text = "";
                      });
                    },
                    color: Colors.green.withOpacity(0.5),
                  ),
                  hintText: "Ask your items !",
                  contentPadding:
                      const EdgeInsets.only(left: 20.0, bottom: 5.0, top: 12.5),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(23),
                      borderSide: const BorderSide(color: Colors.green)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(23),
                      borderSide: const BorderSide(color: Colors.white))),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

void makemessage(String name, String collection, String title) {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  firestore.collection(collection).add({
    'name': name,
    'title': title,
  }).then((value) => null);
}
