import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intro_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 300,
            color: Color.fromARGB(255, 44, 3, 119),
            // color: Colors.amber,
            alignment: Alignment(0, 0),
            child: Stack(
              alignment: Alignment(0, 0.5),
              children: [
                SizedBox(
                  height: 50,
                ),
                Image.asset(
                  alignment: Alignment(-5, 5),
                  'asset/business-3d-search-window.png',
                  // 'asset/animation_lnc8wyu6.json',
                  fit: BoxFit.cover,
                  width: 300,
                  height: 250,
                ),
                Center(
                  child: Container(
                    color: Color.fromARGB(154, 1, 8, 89),
                  ),
                ),
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
        Container(
          height: 462,
          color: const Color.fromARGB(255, 47, 2, 132),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   color: Color.fromARGB(95, 27, 10, 124),
                //   alignment: Alignment(0, 5),
                //   child: Text(
                //     "",
                //     style: TextStyle(
                //         fontSize: 20,
                //         fontWeight: FontWeight.bold,
                //         decoration: TextDecoration.none,
                //         color: Color.fromARGB(255, 103, 100, 247)),
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      // animation_lnc6p2lb.json
                      // color: Colors.white,
                      height: 100,
                      width: 100,
                      child: Lottie.asset('asset/animation_lnc968bm.json',
                          height: 300, width: 300, fit: BoxFit.cover),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                                .withOpacity(0.5), // Warna bayangan utama
                            offset: Offset(0,
                                4), // Posisi bayangan utama (horizontal, vertical)
                            blurRadius: 6.0, // Tingkat ketajaman bayangan utama
                          ),
                          BoxShadow(
                            color: Color.fromARGB(255, 232, 214,
                                214), // Warna bayangan kedua (warna latar belakang)
                            offset: Offset(0,
                                -2), // Posisi bayangan kedua (horizontal, vertical)
                            blurRadius: 6.0, // Tingkat ketajaman bayangan kedua
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Data API Berita",
                  style: TextStyle(
                      fontFamily: 'Croissant',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      color: Color.fromARGB(255, 103, 100, 247)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
