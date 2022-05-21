import 'package:flutter/material.dart';
import 'package:hunger/models/farmers.dart';
import 'package:hunger/widgets/farmers_card.dart';

class FarmersDetailScreen extends StatelessWidget {
  const FarmersDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Buy Directly',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 5, top: 10),
                  child: Text(
                    ' ☀ Selling Farmers',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Colors.yellow[800]),
                  )),
              Container(
                height: MediaQuery.of(context).size.height - 20,
                child: ListView.builder(
                    itemCount: Farmer.farmers.length,
                    itemBuilder: (context, index) {
                      return FarmersCard(
                        farmer: Farmer.farmers[index],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
