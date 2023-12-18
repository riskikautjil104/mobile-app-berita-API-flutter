import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intro_3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 762,
            color: Color.fromARGB(255, 0, 15, 88),
            // color: Colors.amber,
            alignment: Alignment(0, 0),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Lottie.asset(
                  'asset/animation_lncb336r.json',
                  fit: BoxFit.cover,
                  frameRate: FrameRate(100),
                  reverse: true,
                  repeat: true,
                  height: 295,
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Selamat Membaca",
                  style: TextStyle(
                    fontFamily: 'Croissant',
                    decoration: TextDecoration.none,
                    color: Color.fromARGB(255, 75, 159, 237),
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
            // Text(
            //   "Welcome",
            //   style: TextStyle(
            //       fontSize: 40,
            //       fontWeight: FontWeight.bold,
            //       decoration: TextDecoration.none,
            //       color: Color.fromARGB(255, 255, 208, 36)),
            // ),
            ),
        // SizedBox(
        //   height: 200,
        // ),
      ],
    );
  }
}


// animation_lnc6grl6.json
