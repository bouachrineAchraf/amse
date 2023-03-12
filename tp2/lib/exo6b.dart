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

  int counter = 0;

  @override
  void initState() {
    super.initState();
    gridSize = 4;
    _items = List.generate(100, (index) => TileWidget(Tile(index)));

    counter = 0;
  }

  bool _ChangeIndex(int index) {
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
    return Scaffold(
        body: Material(
            type: MaterialType.transparency,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      height: 480, // constrain height
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.fromLTRB(10,10,10,10),
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 2,
                        crossAxisCount: gridSize,
                        children: List.generate(
                            pow(gridSize, 2).toInt(),
                            (index) => InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: EmptySpot == index
                                        ? Colors.white
                                        : Color.fromARGB(255, 138, 140, 142),
                                    border: Border.all(
                                      color: EmptySpot == index
                                          ? Colors.transparent
                                          : _ChangeIndex(index)
                                              ? Color.fromARGB(255, 132, 74, 70)
                                              : Colors.transparent,
                                      width: 5,
                                    ),
                                  ),
                                  child: index == EmptySpot
                                      ? SizedBox(
                                          width: 0,
                                          height: 0,
                                        )
                                      : _items![index],
                                ),
                                onTap: () {
                                  swapTiles(index);
                                })),
                      )),
                  Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Size',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(width: 20),
                      Expanded(
                          child: Slider(
                        value: gridSize.toDouble(),
                        min: 3,
                        max: 8,
                        onChanged: (newValue) {
                          setState(() {
                            gridSize = newValue.round();
                          });
                        },
                        divisions: 7,
                        label: gridSize.toString(),
                      ))
                    ],
                  )),
                ])));
  }

  void swapTiles(int index) {
    Widget tempValue;
    setState(() {
      if (_ChangeIndex(index)) {
        tempValue = _items![EmptySpot];

        _items![EmptySpot] = _items![index];

        _items![index] = tempValue;
        EmptySpot = index;
      }
    });
  }
}
