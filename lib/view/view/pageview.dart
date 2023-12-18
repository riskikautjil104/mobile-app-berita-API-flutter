import 'package:api_flutter/main.dart';
import 'package:api_flutter/view/view/into/intro_1.dart';
import 'package:api_flutter/view/view/into/intro_2.dart';
import 'package:api_flutter/view/view/into/intro_3.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageVIew extends StatefulWidget {
  const PageVIew({Key? key}) : super(key: key);

  @override
  State<PageVIew> createState() => _PageVIew();
}

class _PageVIew extends State<PageVIew> {
  PageController _controller = PageController();

  bool onLasPage = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLasPage = (index == 2);
            });
          },
          children: [
            Intro_1(),
            Intro_2(),
            Intro_3(),
          ],
        ),
        Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text(
                    "skip",
                    style: TextStyle(
                        fontFamily: 'Ucup',
                        decoration: TextDecoration.none,
                        fontSize: 20,
                        color: Color.fromARGB(255, 66, 93, 245),
                        textBaseline: TextBaseline.ideographic),
                  ),
                ),

                SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    textDirection: TextDirection.ltr,
                    effect: WormEffect()),

                // next
                onLasPage
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Main();
                            }));
                          });
                        },
                        child: Text(
                          "done",
                          style: TextStyle(
                              fontFamily: 'Ucup',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 66, 93, 245),
                              decoration: TextDecoration.none,
                              textBaseline: TextBaseline.ideographic),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Text(
                          "next",
                          style: TextStyle(
                              fontFamily: 'Ucup',
                              decoration: TextDecoration.none,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 66, 93, 245),
                              textBaseline: TextBaseline.ideographic),
                        ),
                      ),
              ],
            )),
      ],
    );
  }
}
