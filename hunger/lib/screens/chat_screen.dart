import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hunger/models/farmers.dart';

class ChatScreen extends StatefulWidget {
  final Farmer farmer;
  const ChatScreen({required this.farmer});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    child: Text('Hi'),
                  );
                }),
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
                    onPressed: () {},
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
