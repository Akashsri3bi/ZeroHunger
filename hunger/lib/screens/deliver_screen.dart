import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunger/models/restaurant_model.dart';

class DeliverScreen extends StatefulWidget {
  final String location;

  const DeliverScreen({Key? key, required this.location}) : super(key: key);

  @override
  State<DeliverScreen> createState() => _DeliverScreenState();
}

class _DeliverScreenState extends State<DeliverScreen> {
  TextEditingController controller = TextEditingController();
  TextEditingController Wastecontroller = TextEditingController();
  bool isSwitched = false;
  String? value;

  @override
  void initState() {
    controller.text = widget.location;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Deliver',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 5, left: 8, right: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 250,
                      height: 190,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/deliver2.png'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Collector',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Container(
                            height: 35,
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.green, width: 1),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  iconSize: 30,
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                  ),
                                  items: Restaurant.restaurants
                                      .map(buildMenuItem)
                                      .toList(),
                                  value: value,
                                  isExpanded: true,
                                  onChanged: (value) => setState(() {
                                        this.value = value;
                                      })),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Pick up',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: TextField(
                          controller: controller,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: "Your location",
                              contentPadding: const EdgeInsets.only(
                                  left: 20.0, bottom: 5.0, top: 12.5),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.green)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.white))),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Waste Materials Left',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Container(
                    height: 200,
                    width: double.infinity - 40,
                    child: TextField(
                      expands: true,
                      minLines: null,
                      maxLines: null,
                      controller: Wastecontroller,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: "Enter Waste materials left",
                          contentPadding: const EdgeInsets.only(
                              left: 20.0, bottom: 5.0, top: 12.5),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.red)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.white))),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Switch(
                              value: !isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              },
                              activeTrackColor: Colors.lightGreenAccent,
                              activeColor: Colors.green,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('VEG')
                          ],
                        ),
                        Row(
                          children: [
                            Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              },
                              activeTrackColor: Colors.redAccent,
                              activeColor: Colors.red,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('NON VEG')
                          ],
                        ),
                      ]),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                        ),
                        onPressed: () {
                          (controller.text.isEmpty ||
                                  Wastecontroller.text.isEmpty)
                              ? ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                  content: Text('Please give Info'),
                                  behavior: SnackBarBehavior.floating,
                                ))
                              : ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                  content: Text('Collection Request Sent!!'),
                                  behavior: SnackBarBehavior.floating,
                                ));
                          createDeliveryRequest(
                              value!, controller.text, Wastecontroller.text);
                        },
                        child: const Text(
                          'Deliver',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'lato',
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void createDeliveryRequest(
      String value, String location, String wasteMaterials) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection('DeliveryRequests').add({
      'Collector': value,
      'location': location,
      'wasteLeft': wasteMaterials,
    }).then((value) => null);
  }

  DropdownMenuItem<String> buildMenuItem(Restaurant restaurant) =>
      DropdownMenuItem(
          value: restaurant.name,
          child: Text(
            restaurant.name,
            style: const TextStyle(fontSize: 16),
          ));
}
