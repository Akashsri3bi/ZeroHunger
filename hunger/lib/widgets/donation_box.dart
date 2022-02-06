import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DonationBox extends StatelessWidget {
  const DonationBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(8.0),
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Theme.of(context).primaryColor,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Choose Amount',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CustomPrices();
                    }),
              ),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black.withOpacity(0.9),
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Donate',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'lato',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ))
            ],
          ),
        ),
        Image.asset(
          'assets/logo.png',
          fit: BoxFit.cover,
          height: 150,
          width: 90,
        )
      ]),
    );
  }
}

class CustomPrices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50,
        width: 60,
        margin: const EdgeInsets.only(left: 5, right: 5),
        padding: const EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text('\$${3}',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.black)),
      ),
    );
  }
}
