import 'package:flutter/material.dart';
// import 'package:Taquin/util.dart';
import 'dart:math';


class Tile {
  String imageURL;
  Alignment alignment;

  Tile({required this.imageURL, required this.alignment});

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment:this.alignment,
            widthFactor: 0.5,
            heightFactor: 0.5,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }
}
Tile tile =
    new Tile(imageURL: 'https://picsum.photos/512', alignment: Alignment(-1, -1));

Tile tile2 =
    new Tile(imageURL: 'https://picsum.photos/512', alignment: Alignment(0, -1));


Tile tile3 =
    new Tile(imageURL: 'https://picsum.photos/512', alignment: Alignment(1, -1));

Tile tile4 =
    new Tile(imageURL: 'https://picsum.photos/512', alignment: Alignment(-1, 0));

Tile tile5 =
    new Tile(imageURL: 'https://picsum.photos/512', alignment: Alignment(0, 0));

Tile tile6 =
    new Tile(imageURL: 'https://picsum.photos/512', alignment: Alignment(1, 0));


Tile tile7 =
    new Tile(imageURL: 'https://picsum.photos/512', alignment: Alignment(-1, 1));

Tile tile8 =
    new Tile(imageURL: 'https://picsum.photos/512', alignment: Alignment(0, 1));

Tile tile9 =
    new Tile(imageURL: 'https://picsum.photos/512', alignment: Alignment(1, 1));
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
              padding: const EdgeInsets.all(3),
              child: this.createTileWidgetFrom(tile),
            ),
            Container(
              padding: const EdgeInsets.all(3),
              child: this.createTileWidgetFrom(tile2),
            ),
            Container(
              padding: const EdgeInsets.all(3),
              child: this.createTileWidgetFrom(tile3),
            ),
            Container(
              padding: const EdgeInsets.all(3),
              child: this.createTileWidgetFrom(tile4),
            ),
            Container(
              padding: const EdgeInsets.all(3),
              child: this.createTileWidgetFrom(tile5),
            ),
            Container(
              padding: const EdgeInsets.all(3),
              child: this.createTileWidgetFrom(tile6),
            ),
             Container(
              padding: const EdgeInsets.all(3),
              child: this.createTileWidgetFrom(tile7),
            ),
            Container(
              padding: const EdgeInsets.all(3),
              
              child: this.createTileWidgetFrom(tile8),
            ),
            Container(
              padding: const EdgeInsets.all(3),
              
              child: this.createTileWidgetFrom(tile9),
            ),
          ],
        ));
        
  
  }

Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: tile.croppedImageTile(),
      onTap: () {
        print("tapped on tile");
      },
    );
  }

}
