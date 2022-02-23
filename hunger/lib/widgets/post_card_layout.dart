import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class PostCardLayout extends StatelessWidget {
  bool isHavingImage = false ;

  PostCardLayout({Key? key}) : super(key: key); 
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Header layout ,
          Container(
            padding: const EdgeInsets.all(8.0),
            height: 50,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(''), fit: BoxFit.fill),
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
          const ReadMoreText(
            'Title data coming from firebase database',
            trimLines: 3,
            colorClickableText: Colors.blue,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 2,
          ),
          isHavingImage ? Expanded(child: Image.network('')) : Container() ,
        ],
      ),
    );
  }
}
