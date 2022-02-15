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
            onTap: () {},
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
