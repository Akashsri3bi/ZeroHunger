import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunger/config/theme.dart';
import 'package:hunger/screens/collecting_restaurants_screen.dart';

import 'package:hunger/screens/help.dart';
import 'package:hunger/screens/inform.dart';
import 'package:hunger/screens/map_page.dart';
import 'package:hunger/screens/market_screen.dart';
import 'package:hunger/screens/new_signup.dart';
import 'package:hunger/screens/user.dart';
import 'package:hunger/widgets/donation_box.dart';
import 'package:hunger/widgets/employment_search_box.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = [
    const Donate(),
    const MarketScreen(),
    const InformPage(),
    const Help(),
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
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          selectedItemColor: Colors.lightGreen,
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Market',
              icon: Icon(Icons.shopping_basket),
            ),
            BottomNavigationBarItem(
              label: 'Inform',
              icon: Icon(
                Icons.info_sharp,
              ),
            ),
            BottomNavigationBarItem(
              label: 'help',
              icon: Icon(
                Icons.help,
              ),
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
    BorderRadiusGeometry radius = const BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    return Material(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: SlidingUpPanel(
          minHeight: 60,
          maxHeight: MediaQuery.of(context).size.height - 40,
          panel: const CollectingRestaurants(),
          borderRadius: radius,
          collapsed: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor, borderRadius: radius),
            child: Center(
              child: Column(children: [
                const Icon(Icons.drag_handle_rounded),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "Connecting Restaurants",
                  style: TextStyle(
                      color: Colors.blueGrey[900],
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ]),
            ),
          ),
          //Body behind sliding panel
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
                    child: Expanded(
                      child: Column(children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MapPage(),
                                ));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width - 40,
                            height: 43,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.location_on,
                                  color: Theme.of(context).backgroundColor,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: Text(
                                  'Select Location',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(color: Colors.grey[500]),
                                )),
                              ],
                            ),
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
                        const SizedBox(
                          height: 3,
                        ),
                        const Text(
                          'SOMETHING LEFT ? ',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const MapPage(),
                                      ));
                                },
                                child: Text(
                                  'Deliver now',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                          color: const Color.fromARGB(
                                              255, 33, 243, 159)),
                                ),
                              ),
                            ),

                            /*Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: InkWell(
                              onTap: () {
                                //Top Restaurants Page .
                              },
                              child: Text(
                                'Collecting Restaurants',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: Colors.blue),
                              ),
                            ),
                          ),*/
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ]),
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                ],
              ),
            ),
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
    String? name = FirebaseAuth.instance.currentUser!.displayName;
    return AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: false,
        title: Row(children: [
          Expanded(
            child: Text(
              name != null ? 'Hi, ${name.toString()}' : 'Hi, ${SignUp.name}',
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserScreen()));
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
