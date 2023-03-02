import 'package:flutter/material.dart';
import 'dart:math';

class Tile {
  String imageURL;
  Alignment alignment;

  Tile({required this.imageURL, required this.alignment});

  Widget croppedImageTile(double gridSize) {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: 1 / gridSize,
            heightFactor: 1 / gridSize,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }
}

class DisplayImageWidget extends StatefulWidget {
  @override
  _DisplayImageWidgetState createState() => _DisplayImageWidgetState();
}

class _DisplayImageWidgetState extends State<DisplayImageWidget> {
  double _gridSize = 4;
  List<Tile> _tiles = [];

  @override
  void initState() {
    super.initState();
    _generateTiles();
  }

  void _generateTiles() {
    _tiles.clear();
    for (int i = 0; i < _gridSize * _gridSize; i++) {
      double x = (i % _gridSize) * (2 / (_gridSize - 1)) - 1;
      double y = (i ~/ _gridSize) * (2 / (_gridSize - 1)) - 1;
      _tiles.add(Tile(
          imageURL: 'https://picsum.photos/512',
          alignment: Alignment(x, y)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display image'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text('Adjust grid size'),
          Slider(
            value: _gridSize,
            min: 4,
            max: 8,
            divisions: 4,
            label: _gridSize.toInt().toString(),
            onChanged: (value) {
              setState(() {
                _gridSize = value;
                _generateTiles();
              });
            },
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              primary: false,
              //padding: const EdgeInsets.all(5),
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
              crossAxisCount: _gridSize.toInt(),
              children: _tiles
                  .map((tile) => Container(
                        padding: const EdgeInsets.all(0),
                        child: InkWell(
                          child: tile.croppedImageTile(_gridSize),
                          onTap: () {
                            print("tapped on tile");
                          },
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

