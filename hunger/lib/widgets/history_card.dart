import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunger/models/history.dart';

class HistoryCard extends StatelessWidget {
  final History history;

  const HistoryCard({Key? key, required this.history}) : super(key: key);
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
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(history.imageUrl),
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
                    history.title,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    history.date,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.grey),
                  )
                ],
              ),
            ),
            const SizedBox(width: 2),
            Text(history.status,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Colors.green[500]))
          ],
        ),
      ),
    );
  }
}
