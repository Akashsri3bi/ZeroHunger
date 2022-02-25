import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class PostCardLayout extends StatefulWidget {
  PostCardLayout({Key? key}) : super(key: key);

  @override
  State<PostCardLayout> createState() => _PostCardLayoutState();
}

class _PostCardLayoutState extends State<PostCardLayout> {
  bool isHavingImage = true;
  var container_height = 150;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      /*height: 300,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      */
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Header layout ,
          Container(
            padding: const EdgeInsets.all(8.0),
            height: 65,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: 55,
                      width: 55,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/person1.jpg'),
                              fit: BoxFit.fill),
                          shape: BoxShape.circle)),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Akash Srivastava',
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          '4.5 stars',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),

                  //Maybe later we can add a three dot button for sharing the post or following the person
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: ReadMoreText(
              'Title data coming from firebase database',
              trimLines: 2,
              colorClickableText: Colors.blue,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Roboto', fontSize: 18),
              moreStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          isHavingImage
              ?
              /* Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 250,
                    width: double.infinity - 40,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/waste2.png'),
                          fit: BoxFit.fill),
                    ),
                  )*/
              Wrap(children: [Image.asset('assets/waste2.png')])
              : Container(),
        ],
      ),
    );
  }
}
