import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: const EdgeInsets.all(8.0),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.green,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/zomato.jpg'),
                        fit: BoxFit.fill),
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
                    'Bread Crumbs , Pizza Piece',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '20 jan 2022, 06:03 PM',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.grey),
                  )
                ],
              ),
            ),
            const SizedBox(width: 10),
            Text('\$${15}', style: Theme.of(context).textTheme.headline5!)
          ],
        ),
      ),
    );
  }
}
