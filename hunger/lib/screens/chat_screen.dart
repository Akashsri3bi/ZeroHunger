import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hunger/models/farmers.dart';
import 'package:hunger/widgets/post_card_layout.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class ChatScreen extends StatefulWidget {
  final Farmer farmer;
  const ChatScreen({required this.farmer});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Razorpay? razorpay;
  @override
  void initState() {
    super.initState();

    razorpay = Razorpay();
    razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay!.clear();
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_8OS0sJN7iJjcZx",
      "amount": num.parse(moneycontroller.text) * 100,
      "name": "Starvelp",
      "description": labelcontroller.text,
      "prefill": {
        "contact": phonecontroller.text,
        "email": "",
      },
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay!.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerPaymentSuccess() {
    //print('Payment Sucess');
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Payment Sucess'), behavior: SnackBarBehavior.floating));
  }

  void handlerErrorFailure() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Payment Error'), behavior: SnackBarBehavior.floating));
  }

  void handlerExternalWallet() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('External Wallet'), behavior: SnackBarBehavior.floating));
  }

  final bool initialized = false;
  final db = FirebaseFirestore.instance;
  TextEditingController controller = TextEditingController();
  TextEditingController labelcontroller = TextEditingController();
  TextEditingController moneycontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
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
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        //Show list View of data
                        return ListView(
                          reverse: true,
                          physics: const BouncingScrollPhysics(),
                          children: snapshots.data!.docs.map((doc) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(child: SizedBox()),
                                Expanded(
                                  child: Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 3),
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(23),
                                        color: Colors.green),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        doc.get('title'),
                                        softWrap: true,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        );
                      }
                    })),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  //width: double.infinity - 50,
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.monetization_on,
                            size: 25,
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Pay',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1),
                                    content: Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                'Label',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: TextField(
                                                  controller: labelcontroller,
                                                  decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor:
                                                          Colors.grey[200],
                                                      hintText:
                                                          "Title For Payment",
                                                      contentPadding:
                                                          const EdgeInsets.only(
                                                              left: 20.0,
                                                              bottom: 5.0,
                                                              top: 12.5),
                                                      focusedBorder: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  10),
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .green)),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Colors.white))),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                'Amount',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: TextField(
                                                  controller: moneycontroller,
                                                  decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor:
                                                          Colors.grey[200],
                                                      hintText: 'Enter amount ',
                                                      contentPadding:
                                                          const EdgeInsets.only(
                                                              left: 20.0,
                                                              bottom: 5.0,
                                                              top: 12.5),
                                                      focusedBorder: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  10),
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .green)),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  10),
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .white))),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                'Phone number',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: TextField(
                                                  controller: phonecontroller,
                                                  decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor:
                                                          Colors.grey[200],
                                                      hintText:
                                                          'with country code +91',
                                                      contentPadding:
                                                          const EdgeInsets.only(
                                                              left: 20.0,
                                                              bottom: 5.0,
                                                              top: 12.5),
                                                      focusedBorder: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  10),
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .green)),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Colors.white))),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Center(
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  openCheckout();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.green,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0))),
                                                child: Text(
                                                  'Pay',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline3,
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          color: Colors.green.withOpacity(0.5),
                        ),
                        hintText: "Ask your items ! ",
                        contentPadding: const EdgeInsets.only(
                            left: 20.0, bottom: 5.0, top: 12.5),
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
              ),
              Container(
                margin: const EdgeInsets.only(right: 3),
                height: 50,
                width: 50,
                padding: const EdgeInsets.only(left: 3, top: 3),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).backgroundColor),
                child: IconButton(
                  icon: const Icon(
                    Icons.send,
                    size: 25,
                  ),
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      makemessage(widget.farmer.name, widget.farmer.name,
                          controller.text);
                    }
                    setState(() {
                      controller.text = "";
                    });
                  },
                  color: Colors.white,
                ),
              )
            ],
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
