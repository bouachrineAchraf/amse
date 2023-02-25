import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/medias': (context) => MediasPage(),
        '/favorits': (context) => FavoritsPage(),
      },
    );
  }
}

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            child: Container(
              child: const Text(
                'Home',
                style: TextStyle(color: Colors.white, fontSize: 13.0),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/medias');
            },
            child: Container(
              child: const Text(
                'Medias',
                style: TextStyle(color: Colors.white, fontSize: 13.0),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/favorits');
            },
            child: Container(
              child: const Text(
                'Favorits',
                style: TextStyle(color: Colors.white, fontSize: 13.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}


class MediasPage extends StatelessWidget {
  Future<List<MediaItem>> loadData() async {
    final String jsonData = await rootBundle.loadString('data.json');
    final List<dynamic> raw = json.decode(jsonData);
    return raw.map((json) => MediaItem.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(),
      body: FutureBuilder<List<MediaItem>>(
        future: loadData(),
        builder:
            (BuildContext context, AsyncSnapshot<List<MediaItem>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                'Name: ${snapshot.data![index].title}',
                                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), 
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                'Description: ${snapshot.data![index].description}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          child: Image.asset(snapshot.data![index].imageUrl),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(snapshot.data![index].title),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load media data'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class MediaItem {
  final String imageUrl;
  final String title;
  final String description;

  MediaItem(
      {required this.imageUrl, required this.title, required this.description});

  factory MediaItem.fromJson(Map<String, dynamic> json) {
    return MediaItem(
      imageUrl: json['image'],
      title: json['nom'],
      description: json['description'],
    );
  }
}

class FavoritsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(),
      body: Center(
        child: Text('Favories Page'),
      ),
    );
  }
}
