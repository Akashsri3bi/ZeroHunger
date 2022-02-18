import 'package:firebase_auth/firebase_auth.dart';
import 'package:hunger/models/history.dart';
import 'package:hunger/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:hunger/screens/login.dart';
import 'package:hunger/widgets/history_card.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

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
              UserMain(),
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
                    itemCount: History.history.length,
                    itemBuilder: (context, index) {
                      return HistoryCard(
                        history: History.history[index],
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

class RatingBox extends StatelessWidget {
  const RatingBox({Key? key}) : super(key: key);

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
            //These rating change according to number of donations or waste deliver
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
            Icon(
              Icons.star_border,
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
  UserMain({
    Key? key,
  }) : super(key: key);

  AuthService authService = AuthService();
  String? name = FirebaseAuth.instance.currentUser!.displayName;

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
                    name.toString(),
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      await authService.signOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    },
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
