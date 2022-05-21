import 'package:flutter/material.dart';
import 'package:hunger/models/farmers.dart';
import 'package:hunger/screens/chat_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class FarmersCard extends StatelessWidget {
  final Farmer farmer;

  const FarmersCard({Key? key, required this.farmer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: const EdgeInsets.all(8.0),
      height: 106,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: 56,
                width: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(farmer.imageUrl), fit: BoxFit.fill),
                    shape: BoxShape.circle)),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    farmer.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    farmer.mandi,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'delivery  \$${farmer.deliveryFee}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.red),
                        ),
                      ]),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'delivery time ${farmer.time} mins',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.green),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 2),
            SizedBox(
              height: 50,
              width: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    primary: Colors.green.withOpacity(0.5),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  onPressed: () {
                    launch(farmer.phoneno);
                  },
                  child: const Icon(
                    Icons.call,
                    color: Colors.black,
                  )),
            ),
            const SizedBox(width: 10),
            SizedBox(
              height: 50,
              width: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    primary: Colors.white.withOpacity(0.5),
                    padding: const EdgeInsets.only(top: 15, bottom: 5),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatScreen(
                                  farmer: farmer,
                                )));
                  },
                  child: const Icon(
                    Icons.message,
                    color: Colors.black,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
