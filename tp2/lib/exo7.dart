import 'dart:math';
import 'package:flutter/material.dart';

class Tile {
  int number;
  Tile(this.number);
}

class TileWidget extends StatelessWidget {
  final Tile tile;

  TileWidget(this.tile);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Tile ${tile.number}',
        style: const TextStyle(color: Color.fromARGB(255, 59, 48, 48)),
      ),
    );
  }
}

class DisplayGridView extends StatefulWidget {
  @override
  DisplayGridViewState createState() => DisplayGridViewState();
}

class DisplayGridViewState extends State<DisplayGridView> {
  int gridSize = 4;
  static int EmptySpot = 1;
  List<Widget>? _items;
  bool _gameStarted = false;

  int counter = 0;

  @override
  void initState() {
    super.initState();
    gridSize = 4;
    _items = List.generate(100, (index) => TileWidget(Tile(index)));

    counter = 0;
  }

  bool _changeIndex(int index) {
    return ((EmptySpot != index) &&
        (((EmptySpot % gridSize != 0) && (index + 1 == EmptySpot)) ||
            (((EmptySpot + 1) % gridSize != 0) && (index - 1 == EmptySpot)) ||
            (((EmptySpot + gridSize >= 0) &&
                (index + gridSize == EmptySpot))) ||
            (((EmptySpot + gridSize < pow(gridSize, 2)) &&
                (index - gridSize == EmptySpot)))));
  }

  @override
  Widget build(BuildContext context) {
    double tileSize = MediaQuery.of(context).size.width / gridSize;
    return Scaffold(
      appBar: AppBar(
        title:
Text('Jeu de Taquin'),
centerTitle: true,
),
body: Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
children: <Widget>[
Expanded(
child: GridView.count(
crossAxisCount: gridSize,
children: _items!
.asMap()
.entries
.map(
(entry) => GestureDetector(
onTap: () {
if (_gameStarted) {
int index = entry.key;
if (_changeIndex(index)) {
setState(() {
Widget temp = _items![index];
_items![index] = _items![EmptySpot];
_items![EmptySpot] = temp;
EmptySpot = index;
counter++;
if (_checkWin()) {
showDialog(
context: context,
builder: (BuildContext context) {
return AlertDialog(
title: Text('You Won!'),
content: Text(
'Congratulations! You completed the puzzle in $counter moves.'),
actions: <Widget>[
TextButton(
child: Text('Close'),
onPressed: () {
Navigator.of(context).pop();
},
),
],
);
},
);
}
});
}
} else {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content: Text('Please click on Start Game'),
),
);
}
},
child: Container(
color: Colors.white,
child: Center(
child: SizedBox(
width: tileSize,
height: tileSize,
child: entry.value,
),
),
),
),
)
.toList(),
),
),
Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: [
ElevatedButton(
onPressed: () {
setState(() {
_gameStarted = true;
_items!.shuffle();
EmptySpot = _items!.indexWhere((widget) =>
widget is TileWidget &&
widget.tile.number == _items!.length - 1);
counter = 0;
});
},
child: Text('Start Game'),
),
ElevatedButton(
onPressed: () {
setState(() {
_gameStarted = false;
_items!.sort((a, b) => a is TileWidget && b is TileWidget
? a.tile.number.compareTo(b.tile.number)
: 0);
EmptySpot = 0;
counter = 0;
});
},
child: Text('Reset Game'),
),
],
),
SizedBox(height: 20.0),
],
),
);
}

bool _checkWin() {
for (int i = 0; i < _items!.length; i++) {
if (_items![i] is TileWidget) {
TileWidget tileWidget = _items![i] as TileWidget;
if (tileWidget.tile.number != i) {
return false;
}
}
}
return true;
}
}