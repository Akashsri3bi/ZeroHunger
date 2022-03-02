import 'package:flutter/material.dart';
import 'package:hunger/models/crops.dart';
import 'package:hunger/widgets/crops_card.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Market',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 15, left: 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Crops/Vegetables',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: "Roboto"),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 180,
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: Crop.crops.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return CropsCard(
                          crop: Crop.crops[index],
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
