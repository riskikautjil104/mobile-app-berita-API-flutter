import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intro_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 762,
            color: Color.fromARGB(255, 0, 15, 88),
            // color: Colors.amber,
            alignment: Alignment(0, 0),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Bersiaplah Untuk Membaca",
                    style: TextStyle(
                      fontFamily: 'Croissant',
                      backgroundColor: Color.fromARGB(84, 7, 189, 255),
                      wordSpacing: 10,
                      letterSpacing: 10,
                      decoration: TextDecoration.none,
                      color: Colors.amberAccent,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Lottie.asset(
                    'asset/animation_lncat5ms.json',
                    fit: BoxFit.cover,
                    height: 295,
                  ),

                  // Lottie.asset(
                  //   'asset/animation_lnc8wyu6.json',
                  //   fit: BoxFit.cover,
                  //   height: 230,
                  // ),
                  // Text(
                  //   textAlign: TextAlign.center,
                  //   "Bersiaplah Untuk Membaca",
                  //   style: TextStyle(
                  //     backgroundColor: Color.fromARGB(84, 7, 189, 255),
                  //     wordSpacing: 10,
                  //     letterSpacing: 10,
                  //     decoration: TextDecoration.none,
                  //     color: Colors.amberAccent,
                  //     fontSize: 15,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // )
                ],
              ),
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
