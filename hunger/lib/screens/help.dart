import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/helping.png'),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Hey Restaurants ,',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 30, left: 30),
                child: Center(
                  child: Text(
                    'Integrate with us to collect food ',
                    style: TextStyle(color: Colors.grey, fontSize: 24),
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'material',
                  style: TextStyle(color: Colors.grey, fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black.withOpacity(0.9),
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Join Us',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'lato',
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
              ),
              const SizedBox(
                height: 5,
              ),
              Divider(
                height: 20,
                thickness: 10,
                color: Colors.grey.shade300,
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Hey Volunteers ,',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.red),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 30, left: 30),
                child: Center(
                  child: Text(
                    'Become a delivery partner and',
                    style: TextStyle(color: Colors.grey, fontSize: 24),
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'Serve the community',
                  style: TextStyle(color: Colors.grey, fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red.withOpacity(0.7),
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Volunteer',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'lato',
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
