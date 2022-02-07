import 'package:flutter/material.dart';
import 'package:hunger/widgets/history_card.dart';

class User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const UserMain(),
              const SizedBox(
                height: 10,
              ),
              RatingBox(),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'History',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.red),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 400,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return HistoryCard();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RatingBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        const Icon(
          Icons.star,
          size: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(
          'Rating',
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.blue),
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            //These rating change according to number of donnations or waste deliver
            Icon(
              Icons.star,
              color: Colors.green,
              size: 35,
            ),
            Icon(
              Icons.star,
              color: Colors.green,
              size: 35,
            ),
            Icon(
              Icons.star_half,
              color: Colors.green,
              size: 35,
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ]),
    );
  }
}

class UserMain extends StatelessWidget {
  const UserMain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Akash',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Log out >',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.pink[400]),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.grey,
                  )
                ]),
          ),
        ),
        Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/person1.jpg'), fit: BoxFit.fill),
                shape: BoxShape.circle)),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }
}
