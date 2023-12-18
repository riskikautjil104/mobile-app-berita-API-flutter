// import 'dart:html';

import 'package:api_flutter/antara.dart';
import 'package:api_flutter/api/repository.dart';
import 'package:api_flutter/models/index.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(brightness: Brightness.dark),
    home: Main(),
  ));
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  // int _selectedIndex = 0;
  // final List<Widget> _pages = [
  //   Main(),
  //   Antara(),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Api'),
        backgroundColor: Color.fromARGB(255, 0, 15, 88),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 3, 29, 160),
              ),
              child: Text(
                'Informasi ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      // appBar: AppBar(
      //   title: Text("Api Data"),
      //   backgroundColor: Color.fromARGB(255, 206, 155, 1),
      //   leading: IconButton(
      //     icon: Icon(Icons.menu),
      //     onPressed: () {},
      //   ),
      //   // actions: [
      //   //   IconButton(
      //   //     onPressed: () {
      //   //       Navigator.push(
      //   //           context, MaterialPageRoute(builder: (context) => Antara()));
      //   //     },
      //   //     icon: Icon(Icons.api_outlined),
      //   //   )
      //   // ],
      // ),
      // drawer: Drawer(
      //   // Isi drawer sebelah kiri
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //         child: Text(
      //           'Menu',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 24,
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         title: Text('Item 1'),
      //         onTap: () {
      //           // Tindakan saat item 1 dipilih
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Item 2'),
      //         onTap: () {
      //           // Tindakan saat item 2 dipilih
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      body: Data(),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        color: Color.fromARGB(255, 0, 15, 88),
        items: <Widget>[
          Icon(Icons.home, size: 30),
          SizedBox.shrink(),
          Icon(
            Icons.list,
            size: 30,
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            // Pindah langsung ke halaman "Home"
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (BuildContext context) {
                return Main();
              },
            ));
          } else if (index == 1) {
          } else {
            // Selain indeks 0, tampilkan showDialog konfirmasi
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Konfirmasi"),
                  content: Text("Melihat Halaman Berita??"),
                  actions: <Widget>[
                    TextButton(
                      child: Text("Batal"),
                      onPressed: () {
                        Navigator.of(context).pop(); // Tutup dialog
                      },
                    ),
                    TextButton(
                      child: Text("Ya"),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return Antara();
                        })); // Tutup dialog
                        // Pindah ke halaman yang dipilih
                        // if (index == 1) {
                        //   Navigator.pushReplacement(context, MaterialPageRoute(
                        //     builder: (BuildContext context) {
                        //       return Antara();
                        //     },
                        //   ));
                        // }
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}

// menampilkan data Api
class Data extends StatefulWidget {
  const Data({super.key});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  List<Endpoint> data = [];

  Repository repository = Repository();

  getData() async {
    data = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        // final datas = data[index];
        if (data.isNotEmpty) {
          return Container(
            color: const Color.fromARGB(255, 47, 2, 132),
            child: Column(
              children: [
                Card(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return Antara();
                          }));
                        },
                        child: Container(
                          color: const Color.fromARGB(255, 47, 2, 132),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'API : ${data[index].name}',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontFamily: 'Croissant',
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   alignment: Alignment.centerLeft,
                      //   child: Text(
                      //     'API : ${data[index].name}',
                      //     style: TextStyle(fontSize: 40.0),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 30,
                      // ),
                      // Divider(
                      //   // height: 30.0,
                      //   // indent: 30.0,
                      //   color: Color.fromARGB(255, 255, 255, 255),
                      // ),
                      Container(
                        color: const Color.fromARGB(255, 47, 2, 132),
                        child: Column(
                          children: data[index].paths.map((pathObj) {
                            return Card(
                              color: Color.fromARGB(255, 2, 36, 204),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tema: ${pathObj.name}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Croissant',
                                    ),
                                  ),
                                  Text(
                                    "Path: ${pathObj.path}",
                                    style: TextStyle(fontFamily: 'Ucup'),
                                  ),
                                  SizedBox(
                                      height: 10), // Jarak antara setiap path
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                // Text(data[index].name),
                // Text(data[index].toString()),
              ],
            ),
          );
        } else {
          return CircularProgressIndicator(); // Menampilkan indikator loading jika data masih kosong
        }
      },
    );
  }
}
