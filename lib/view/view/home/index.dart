import 'package:flutter/material.dart';

class HomeIndex extends StatelessWidget {
  const HomeIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navbar"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.warning_amber))
        ],
      ),
      body: Center(
        child: Container(
          child: Text("Halaman Home"),
        ),
      ),
    );
  }
}
