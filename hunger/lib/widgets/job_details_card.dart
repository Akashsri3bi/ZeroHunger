import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunger/models/employment_details.dart';
import 'package:url_launcher/url_launcher.dart';

class JobDetailsCard extends StatelessWidget {
  final Result result;

  const JobDetailsCard({Key? key, required this.result}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        padding: const EdgeInsets.all(8.0),
        /*height: 250,
        width: double.infinity,*/
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blueAccent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    result.title,
                    style: const TextStyle(
                        fontSize: 20,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  result.company,
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  result.place,
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '\$ ${result.salary_min}',
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.donut_small),
                    Expanded(
                      child: Text(
                        result.description,
                        softWrap: true,
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[800],
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                    ),
                    onPressed: () async {
                      if (await canLaunch(result.url)) {
                        await launch(result.url,
                            forceWebView: true,
                            forceSafariVC: false,
                            enableJavaScript: true);
                      } else {
                        throw 'Could not launch ${result.url}';
                      }
                    },
                    child: const Text(
                      'Apply',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'lato',
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
