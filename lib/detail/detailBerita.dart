import 'package:flutter/material.dart';
import 'package:api_flutter/models/antaraModel.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class DetailBerita extends StatelessWidget {
  final DataBerita dataBerita;
  final int selectedIndex; // Indeks posting yang dipilih

  const DetailBerita(
      {Key? key, required this.dataBerita, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedPost = dataBerita.posts[selectedIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
        title: Text('Halaman Detail'),
      ),
      body: ListView(
        children: [
          Image.network(selectedPost.thumbnail),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              selectedPost.title,
              style: TextStyle(
                color: Colors.amber[200],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            color: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              selectedPost.description,
              style: TextStyle(fontSize: 16),
              // maxLines: 5000,
              // overflow: TextOverflow.ellipsis,
            ),
          ),

          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.star, color: Colors.green[500]),
                Icon(Icons.star, color: Colors.green[500]),
                Icon(Icons.star, color: Colors.green[500]),
                const Icon(Icons.star, color: Colors.black),
                const Icon(Icons.favorite, color: Colors.red),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Komentar',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Kirim'),
            ),
          ),
          // Tambahkan informasi detail lainnya sesuai kebutuhan, seperti tanggal, dll.
        ],
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: Color.fromARGB(255, 119, 187, 254),
      //   items: <Widget>[
      //     Icon(Icons.home, size: 30),
      //     Icon(Icons.list, size: 30),
      //     Icon(Icons.compare_arrows, size: 30),
      //   ],
      //   onTap: (index) {
      //     //Handle button tap
      //   },
      // ),
      // persistentFooterButtons: [
      //   ConstrainedBox(
      //     constraints: BoxConstraints.expand(),
      //     child: Container(
      //       color: Colors.amber,
      //       child: Row(
      //         children: [
      //           Container(
      //             child: IconButton(
      //               icon: Icon(Icons.home),
      //               onPressed: () {},
      //             ),
      //           ),
      //           Padding(padding: EdgeInsets.only(left: 100)),
      //           Container(
      //             child: IconButton(
      //               // alignment: Alignment.center,
      //               // padding: EdgeInsets.only(left: 100),
      //               icon: Icon(Icons.details),
      //               onPressed: () {},
      //             ),
      //           ),
      //           Padding(padding: EdgeInsets.only(left: 100)),
      //           IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit_sharp))
      //         ],
      //       ),
      //     ),
      //   ),
      // ],
    );
  }
}
