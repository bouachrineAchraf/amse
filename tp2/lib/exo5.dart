import 'package:flutter/material.dart';
// import 'package:Taquin/util.dart';
import 'dart:math';

class DisplayImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Display image'),
        ),
        // body: Center(child: Image.network("https://picsum.photos/1024")));
        body:
        //Image.network('https://picsum.photos/512', fit: BoxFit.cover))
        GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
          crossAxisCount: 3,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[100],
              child: const Text("title 1"),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[200],
              child: const Text('title 2'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[300],
              child: const Text('title 3'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[400],
              child: const Text('title 4'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[500],
              child: const Text('title 5'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[600],
              child: const Text('title 6'),
            ),
             Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[700],
              child: const Text('title 7'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[800],
              child: const Text('title 8'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[900],
              child: const Text('title 9'),
            ),
          ],
        ));
  }
}
