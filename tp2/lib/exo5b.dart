import 'package:flutter/material.dart';
import 'dart:math';

// class Tile {
//   String imageURL;
//   Alignment alignment;

//   Tile({required this.imageURL, required this.alignment});

//   Widget croppedImageTile() {
//     return FittedBox(
//       fit: BoxFit.fill,
//       child: ClipRect(
//         child: Container(
//           child: Align(
//             alignment:this.alignment,
//             widthFactor: 0.5,
//             heightFactor: 0.5,
//             child: Image.network(this.imageURL),
//           ),
//         ),
//       ),
//     );
//   }
// }
// Tile tile =
//     new Tile(imageURL: 'https://picsum.photos/512', alignment: Alignment(-1, -1));

// Tile tile2 =
//     new Tile(imageURL: 'https://picsum.photos/512', alignment: Alignment(0, -1));

// Tile tile3 =
//     new Tile(imageURL: 'https://picsum.photos/512', alignment: Alignment(1, -1));

// Tile tile4 =
//     new Tile(imageURL: 'https://picsum.photos/512', alignment: Alignment(-1, 0));

// Tile tile5 =
//     new Tile(imageURL: 'https://picsum.photos/512', alignment: Alignment(0, 0));

// Tile tile6 =
//     new Tile(imageURL: 'https://picsum.photos/512', alignment: Alignment(1, 0));

// Tile tile7 =
//     new Tile(imageURL: 'https://picsum.photos/512', alignment: Alignment(-1, 1));

// Tile tile8 =
//     new Tile(imageURL: 'https://picsum.photos/512', alignment: Alignment(0, 1));

// Tile tile9 =
//     new Tile(imageURL: 'https://picsum.photos/512', alignment: Alignment(1, 1));
// class DisplayImageWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Display image'),
//         ),
//         // body: Center(child: Image.network("https://picsum.photos/1024")));
//         body:
//         //Image.network('https://picsum.photos/512', fit: BoxFit.cover))
//         GridView.count(
//           primary: false,
//           padding: const EdgeInsets.all(20),
//           crossAxisSpacing: 3,
//           mainAxisSpacing: 3,
//           crossAxisCount: 3,
//           children: <Widget>[
//             Container(
//               padding: const EdgeInsets.all(3),
//               child: this.createTileWidgetFrom(tile),
//             ),
//             Container(
//               padding: const EdgeInsets.all(3),
//               child: this.createTileWidgetFrom(tile2),
//             ),
//             Container(
//               padding: const EdgeInsets.all(3),
//               child: this.createTileWidgetFrom(tile3),
//             ),
//             Container(
//               padding: const EdgeInsets.all(3),
//               child: this.createTileWidgetFrom(tile4),
//             ),
//             Container(
//               padding: const EdgeInsets.all(3),
//               child: this.createTileWidgetFrom(tile5),
//             ),
//             Container(
//               padding: const EdgeInsets.all(3),
//               child: this.createTileWidgetFrom(tile6),
//             ),
//              Container(
//               padding: const EdgeInsets.all(3),
//               child: this.createTileWidgetFrom(tile7),
//             ),
//             Container(
//               padding: const EdgeInsets.all(3),

//               child: this.createTileWidgetFrom(tile8),
//             ),
//             Container(
//               padding: const EdgeInsets.all(3),

//               child: this.createTileWidgetFrom(tile9),
//             ),
//           ],
//         ));

//   }

// Widget createTileWidgetFrom(Tile tile) {
//     return InkWell(
//       child: tile.croppedImageTile(),
//       onTap: () {
//         print("tapped on tile");
//       },
//     );
//   }

// }

// import 'package:flutter/material.dart';
// import 'dart:math';

// class Tile {
//   String imageURL;
//   Alignment alignment;

//   Tile({required this.imageURL, required this.alignment});

//   Widget croppedImageTile(double widthFactor, double heightFactor) {
//     return FittedBox(
//       fit: BoxFit.fill,
//       child: ClipRect(
//         child: Container(
//           child: Align(
//             alignment: this.alignment,
//             widthFactor: widthFactor,
//             heightFactor: heightFactor,
//             child: Image.network(this.imageURL),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DisplayImageWidget extends StatefulWidget {
//   @override
//   _DisplayImageWidgetState createState() => _DisplayImageWidgetState();
// }

// class _DisplayImageWidgetState extends State<DisplayImageWidget> {
//   double _sliderValue = 4.0;
//   List<Tile> _tiles = [];

//   @override
//   void initState() {
//     super.initState();
//     _generateTiles();
//   }

//   void _generateTiles() {
//     _tiles.clear();
//     int numTiles = _sliderValue.toInt() * _sliderValue.toInt();
//     double stepSize = 2.0 / (_sliderValue.toInt() - 1);

//     for (int i = 0; i < numTiles; i++) {
//       int row = i ~/ _sliderValue.toInt();
//       int col = i % _sliderValue.toInt();
//       double x = -1.0 + col * stepSize;
//       double y = -1.0 + row * stepSize;
//       _tiles.add(Tile(
//           imageURL: 'https://picsum.photos/512',
//           alignment: Alignment(x, y)));
//     }
//   }

//   Widget _createTileWidgetFrom(Tile tile, double widthFactor, double heightFactor) {
//     return InkWell(
//       child: tile.croppedImageTile(widthFactor, heightFactor),
//       onTap: () {
//         print("tapped on tile");
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     double widthFactor = 2.0 / _sliderValue;
//     double heightFactor = 2.0 / _sliderValue;
    
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Display image'),
//       ),
//       body: Column(
//         children: [
//           Slider(
//             min: 4,
//             max: 8,
//             divisions: 4,
//             value: _sliderValue,
//             onChanged: (value) {
//               setState(() {
//                 _sliderValue = value;
//                 _generateTiles();
//               });
//             },
//           ),
//           Expanded(
//             child: GridView.count(
//               primary: false,
//               padding: const EdgeInsets.all(20),
//               crossAxisSpacing: 3,
//               mainAxisSpacing: 3,
//               crossAxisCount: _sliderValue.toInt(),
//               children: _tiles
//                   .map((tile) => Container(
//                         padding: const EdgeInsets.all(3),
//                         child: _createTileWidgetFrom(
//                             tile, widthFactor, heightFactor),
//                       ))
//                   .toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


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

