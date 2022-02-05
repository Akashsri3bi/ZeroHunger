import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunger/config/theme.dart';
import 'package:hunger/screens/help.dart';
import 'package:hunger/screens/inform.dart';
import 'package:hunger/screens/user.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        child: Column(children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.vertical(
                  bottom:
                      Radius.elliptical(MediaQuery.of(context).size.width, 50),
                ),
                image: const DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/hunger.png'),
                )),
          ),
        ]),
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
              'Hi, AKASH',
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
