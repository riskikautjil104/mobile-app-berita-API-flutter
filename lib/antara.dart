import 'package:api_flutter/api/antara.dart';
import 'package:api_flutter/detail/detailBerita.dart';
import 'package:api_flutter/main.dart';
import 'package:api_flutter/models/antaraModel.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/assets/'

// import 'models/antaraModel.dart';

class Antara extends StatefulWidget {
  @override
  State<Antara> createState() => _AntaraState();
}

class _AntaraState extends State<Antara> {
  List<DataBerita> dataApi = [];
  DataRepository dataRepository = DataRepository();

  @override
  void initState() {
    super.initState();
    getDataApi();
  }

  getDataApi() async {
    final data = await dataRepository.fetchData();
    setState(() {
      dataApi = [data];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar.appBar(context),
      body: ListView.builder(
        itemCount: dataApi.length > 0 ? dataApi[0].posts.length : 0,
        itemBuilder: (context, index) {
          final item = dataApi[0].posts[index];
          final gambar = item.thumbnail;

          return Card(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return DetailBerita(
                    dataBerita: dataApi[0], // Kirim semua data berita
                    selectedIndex: index, // Kirim indeks posting yang dipilih
                  );
                }));
              },
              child: Column(
                children: [
                  Image.network(gambar),
                  Container(
                    color: const Color.fromARGB(255, 47, 2, 132),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${item.title}',
                          style: TextStyle(
                              fontSize: 25,
                              // fontFamily: ucup,
                              fontFamily: 'Ucup',
                              color: Color.fromARGB(255, 206, 155, 1)),
                        ),
                        Text('Selengkapnya >>'),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'url: ${item.link}',
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Croissant',
                          ),
                        ),
                        // ListTile(
                        //   title: Text(
                        //     'link: ${item.link}',
                        //     style: TextStyle(fontSize: 10),
                        //   ),
                        //   subtitle: Text('descripsi : ${item.description}'),
                        //   onTap: () {
                        //     // Handle item tap here, e.g., navigate to a detailed view
                        //   },
                        // ),
                        Divider(
                          height: 10,
                        ),
                        Text(
                          'upload : ${item.pubDate}',
                          style:
                              TextStyle(fontSize: 8, color: Colors.redAccent),
                        ),
                        // Text('Title : ${item.pubDate}'),
                      ],
                    ),
                  ),
                  // ListTile(
                  //   title: Text('Title : ${item.title}'),
                  //   subtitle: Text('descripsi : ${item.description}'),
                  //   onTap: () {
                  //     // Handle item tap here, e.g., navigate to a detailed view
                  //   },
                  // ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Color.fromARGB(255, 0, 15, 88),
        backgroundColor: Color.fromARGB(255, 255, 240, 211),
        items: <Widget>[
          Icon(
            Icons.list,
            size: 30,
            color: Color.fromARGB(252, 234, 232, 232),
          ),
          SizedBox.shrink(),
          Icon(
            Icons.home,
            size: 30,
            color: Color.fromARGB(255, 197, 193, 193),
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            // Pindah langsung ke halaman "Home"
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (BuildContext context) {
                return Antara();
              },
            ));
          } else {
            // Selain indeks 0, tampilkan showDialog konfirmasi
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Konfirmasi"),
                  content: Text("Yakin ingin pindah halaman?"),
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
                          return Main();
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

class Navbar {
  static AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 0, 15, 88),
      automaticallyImplyLeading: false,
      // leading: IconButton(
      //   icon: Icon(Icons.arrow_back),
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      // ),
      title: Text(
        'Antara.news',
        // textAlign: TextAlign.end,
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
      actions: [
        IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Perhatian"),
                      content: Text("halaman ini belum siap"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                return Antara();
                              }));
                            },
                            child: Text("Batal"))
                      ],
                    );
                  });
            },
            icon: Icon(
              Icons.person_pin,
              size: 30,
            ))
      ],
    );
  }
}
