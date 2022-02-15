import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunger/models/restaurant_model.dart';
import 'package:hunger/widgets/online_food_card.dart';
import 'package:hunger/widgets/restaurant_card.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CollectingRestaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = const BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: radius,
        ),
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
                  itemCount: Restaurant.restaurants.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return RestaurantCard(
                      restaurant: Restaurant.restaurants[index],
                    );
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
                    itemCount: Restaurant.onlineRestaurants.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return OnlineFoodCard(
                        restaurant: Restaurant.onlineRestaurants[index],
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
