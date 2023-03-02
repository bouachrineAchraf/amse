import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyGridView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyGridViewState();
}

class MyGridViewState extends State<MyGridView> {
  int gridSize = 3;
  List<String> tileValues = [];

  @override
  void initState() {
    super.initState();
    generateTileValues();
  }

  void generateTileValues() {
    tileValues.clear();
    int totalTiles = gridSize * gridSize;
    for (int i = 0; i < totalTiles; i++) {
      tileValues.add(i == 0 ? '' : i.toString());
    }
  }

 void swapTile(int index) {
  int emptyIndex = tileValues.lastIndexOf('');
  int previousIndex = index - 1;
  int nextIndex = index + 1;
  int previousRow = index - gridSize;
  int nextRow = index + gridSize;

  List<int> adjacentIndexes = [];

  // Determine the adjacent tile indexes
  if (previousIndex >= 0 && index % gridSize != 0) {
    adjacentIndexes.add(previousIndex);
  }
  if (nextIndex < tileValues.length && (index + 1) % gridSize != 0) {
    adjacentIndexes.add(nextIndex);
  }
  if (previousRow >= 0) {
    adjacentIndexes.add(previousRow);
  }
  if (nextRow < tileValues.length) {
    adjacentIndexes.add(nextRow);
  }

  if (adjacentIndexes.contains(emptyIndex)) {
    tileValues[emptyIndex] = tileValues[index];
    tileValues[index] = '';
  }

  setState(() {});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Grid Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: GridView.count(
                crossAxisCount: gridSize,
                children: [
                  for (int i = 0; i < tileValues.length; i++)
                    InkWell(
                      onTap: () {
                        swapTile(i);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: tileValues[i].isEmpty
                              ? Colors.white
                              : Color.fromARGB(255, 34, 110, 177),
                          border: getAdjacentTiles(i).contains(tileValues.lastIndexOf('')) ? Border.all(color: Colors.red, width: 2) : null,
                        ),
                        child: Center(
                          child: Text(
                            tileValues[i].isEmpty
                                ? 'empty 0'
                                : 'Tile ${tileValues[i]}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Size'),
                const SizedBox(width: 20),
                Expanded(
                  child: Slider(
                    min: 3,
                    max: 8,
                    divisions: 6,
                    value: gridSize.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        gridSize = value.toInt();
                        generateTileValues();
                      });
                    },
                  ),
                ),
                Text('$gridSize x $gridSize'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<int> getAdjacentTiles(int index) {
    int emptyIndex = tileValues.lastIndexOf('');
    int previousIndex = index - 1;
    int nextIndex = index + 1;
    int previousRow = index - gridSize;
    int nextRow = index + gridSize;
    List<int> adjacentTiles = [];
    if (emptyIndex == previousIndex) {
      adjacentTiles.add(index);
      adjacentTiles.add(previousIndex);
    } else if (emptyIndex == nextIndex) {
      adjacentTiles.add(index);
      adjacentTiles.add(nextIndex);
    } else if (emptyIndex == previousRow) {
      adjacentTiles.add(index);
      adjacentTiles.add(previousRow);
    } else if (emptyIndex == nextRow) {
      adjacentTiles.add(index);
      adjacentTiles.add(nextRow);
    }
    return adjacentTiles;
  }
}
