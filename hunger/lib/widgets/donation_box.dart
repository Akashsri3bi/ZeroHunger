import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunger/models/price.dart';

class DonationBox extends StatefulWidget {
  const DonationBox({
    Key? key,
  }) : super(key: key);

  @override
  State<DonationBox> createState() => _DonationBoxState();
}

class _DonationBoxState extends State<DonationBox> {
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
                  ' Choose Amount',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: Price.prices.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CustomPrices(
                        price: Price.prices[index],
                      );
                    }),
              ),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black.withOpacity(0.9),
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                  ),
                  onPressed: () {
                    int sum = 0;
                    Price.prices.forEach((price) {
                      if (price.selected) {
                        price.selected = false;
                        sum += price.value;
                      }
                    });
                    sum == 0
                        ? ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                            content: Text('Choose amount'),
                            behavior: SnackBarBehavior.floating,
                          ))
                        : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text('\$$sum Donated to Farmers Foundation'),
                            behavior: SnackBarBehavior.floating,
                          ));
                    setState(() {
                      //Simple change of state
                    });
                  },
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

class CustomPrices extends StatefulWidget {
  final Price price;

  const CustomPrices({Key? key, required this.price}) : super(key: key);

  @override
  State<CustomPrices> createState() => _CustomPricesState();
}

class _CustomPricesState extends State<CustomPrices> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.price.selected = !widget.price.selected;
        });
      },
      child: Container(
        height: 50,
        width: 60,
        margin: const EdgeInsets.only(left: 5, right: 5),
        //padding: const EdgeInsets.only(left: 10, top: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.price.selected ? Colors.greenAccent : Colors.grey[50],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text('\$${widget.price.value}',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.black)),
      ),
    );
  }
}
