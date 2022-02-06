import 'package:flutter/material.dart';
import 'package:hunger/widgets/online_food_card.dart';
import 'package:hunger/widgets/restaurant_card.dart';

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
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Restaurants',
              style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return RestaurantCard();
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Ordered Online ?',
              style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: 185,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return OnlineFoodCard();
                    }))
          ],
        ),
      ),
    );
  }
}
