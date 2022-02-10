import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunger/config/theme.dart';
import 'package:hunger/screens/help.dart';
import 'package:hunger/screens/inform.dart';
import 'package:hunger/screens/user.dart';
import 'package:hunger/widgets/donation_box.dart';
import 'package:hunger/widgets/employment_search_box.dart';
import 'package:hunger/service/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService authService = AuthService();
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = [
    const Donate(),
    Inform(),
    Help(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).backgroundColor,
          type: BottomNavigationBarType.shifting,
          onTap: _onItemTapped,
          selectedItemColor: Colors.lightBlue,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: const Icon(
                Icons.home,
              ),
              backgroundColor: Theme.of(context).backgroundColor,
            ),
            BottomNavigationBarItem(
              label: 'Inform',
              icon: const Icon(
                Icons.info_sharp,
              ),
              backgroundColor: Theme.of(context).backgroundColor,
            ),
            BottomNavigationBarItem(
              label: 'help',
              icon: const Icon(
                Icons.help,
              ),
              backgroundColor: Theme.of(context).backgroundColor,
            ),
          ]),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}

class Donate extends StatelessWidget {
  const Donate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFB9E4C9),
          child: Column(
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 50),
                    ),
                    image: const DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/hunger.png'),
                    )),
              ),
              const SizedBox(
                height: 5,
              ),
              const EmploymentSearchBox(),
              const SizedBox(
                height: 5,
              ),
              const DonationBox(),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(8.0),
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.black87,
                ),
                child: Column(children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "ENTER LOCATION   ",
                          prefixIcon: Icon(
                            Icons.location_on,
                            color: Theme.of(context).primaryColor,
                          ),
                          contentPadding: const EdgeInsets.only(
                              left: 20.0, bottom: 5.0, top: 12.5),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.green)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.white))),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    'assets/waste2.png',
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const Text(
                    'SOMETHING LEFT ? ',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Gill Sans',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            'Deliver now',
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(color: Colors.blue),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            'Connect to Restaurants',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget with ObstructingPreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: false,
        title: Row(children: [
          Expanded(
            child: Text(
              'Hi, $userName',
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: Colors.white),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.person_pin),
            iconSize: 35,
            color: Colors.yellow[300],
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => User()));
            },
          ),
        ]));
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }
}
