import 'package:flutter/material.dart';
// import 'package:Taquin/util.dart';
import 'dart:math';

class DisplayImageWidget extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Image.network('https://picsum.photos/512/1024',
      loadingBuilder: (context, child, progress) {
        return progress == null ? child : LinearProgressIndicator();
      },
      ),
    );
  }
}
