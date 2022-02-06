import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnlineFoodCard extends StatelessWidget {
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
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/zomato.jpg'),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Text(
            'Zomato',
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
