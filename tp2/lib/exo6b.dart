import 'package:flutter/material.dart';
import 'dart:math' as math;

// ==============
// Models
// ==============

math.Random random = new math.Random();

class Tile {
  int index;

  Tile(this.index);
  // Tile.randomColor() {
  //   this.color = Color.fromARGB(
  //       255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  // }
}

// ==============
// Widgets
// ==============

class TileWidget extends StatelessWidget {
  final Tile tile;

  TileWidget(this.tile);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.teal[100],
      child: Center(
        child: Text(
          'tile ${tile.index}',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

void main() => runApp(new MaterialApp(home: PositionedTiles()));

class PositionedTiles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  List<Widget> tiles =
      List<Widget>.generate(16, (index) => TileWidget(Tile(index)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moving Tiles'),
        centerTitle: true,
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        crossAxisCount: 4,
        children: tiles,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.sentiment_very_satisfied), onPressed: swapTiles),
    );
  }

  swapTiles() {
    setState(() {
      //print(tiles);
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}
