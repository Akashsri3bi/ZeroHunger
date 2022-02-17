import 'package:flutter/material.dart';
import 'package:hunger/models/crops.dart';
import 'package:hunger/screens/farmers_detail_screen.dart';

class CropsCard extends StatelessWidget {
  final Crop crop;

  const CropsCard({Key? key, required this.crop}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => FarmersDetailScreen()));
      },
      child: Container(
        child: Column(children: [
          Container(
            height: 145,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                  image: NetworkImage(crop.imageUrl), fit: BoxFit.fill),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              crop.name,
              style: const TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      ),
    );
  }
}
