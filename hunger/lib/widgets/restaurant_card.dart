import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  //We will use custom Clipper widget to give different shapes and design to our promotion box.
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 100,
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        width: MediaQuery.of(context).size.width - 10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Theme.of(context).primaryColor,
            image: const DecorationImage(
                image: AssetImage('assets/restaurant1.jpg'),
                fit: BoxFit.cover)),
      ),
      ClipPath(
        clipper: PromoCustomClipper(),
        child: Container(
          height: 100,
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          width: MediaQuery.of(context).size.width - 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Theme.of(context).primaryColor,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LA MARTA',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Deliver Now',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}

class PromoCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(190, size.height);
    path.lineTo(225, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
