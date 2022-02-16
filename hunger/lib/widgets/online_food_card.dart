import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunger/models/restaurant_model.dart';

class OnlineFoodCard extends StatefulWidget {
  final Restaurant restaurant;

  const OnlineFoodCard({Key? key, required this.restaurant}) : super(key: key);

  @override
  State<OnlineFoodCard> createState() => _OnlineFoodCardState();
}

class _OnlineFoodCardState extends State<OnlineFoodCard> {
  TextEditingController controller = TextEditingController();
  TextEditingController wastecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 5,
      ),
      padding: const EdgeInsets.all(8.0),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 30,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.restaurant.imageUrl)),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Text(
            widget.restaurant.name,
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.red),
          )),
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(widget.restaurant.name,
                          style: Theme.of(context).textTheme.headline1),
                      content: Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Order Id',
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
                                        hintText: "Order id",
                                        contentPadding: const EdgeInsets.only(
                                            left: 20.0, bottom: 5.0, top: 12.5),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Colors.green)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Colors.white))),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 100,
                              width: double.infinity - 40,
                              child: TextField(
                                expands: true,
                                minLines: null,
                                maxLines: null,
                                controller: wastecontroller,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    hintText: "What's Left ?",
                                    contentPadding: const EdgeInsets.only(
                                        left: 20.0, bottom: 5.0, top: 12.5),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.red)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.white))),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                  onPressed: () {
                                    //Navigator.of(context).pop();
                                    (controller.text.isEmpty ||
                                            wastecontroller.text.isEmpty)
                                        ? ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                            content: Text('Enter Info'),
                                            behavior: SnackBarBehavior.floating,
                                          ))
                                        : ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                            content:
                                                Text('Collection Request Sent'),
                                            behavior: SnackBarBehavior.floating,
                                          ));
                                    if (controller.text.isNotEmpty &&
                                        wastecontroller.text.isNotEmpty) {
                                      Navigator.of(context).pop();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red[500],
                                  ),
                                  child: const Text(
                                    'Return LeftOver',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'lato',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: Text(
              'Return',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
