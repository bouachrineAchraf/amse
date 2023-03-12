import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'SharedAppBar.dart';
import 'HomePage.dart';
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
        '/favorits': (context) =>
            FavoritsPage(favoritedMediaItems: favoriteMediaItems),
      },
    );
  }
}

// class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       child: AppBar(
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.pushNamed(context, '/home');
//             },
//             child: Container(
//               child: const Text(
//                 'Home',
//                 style: TextStyle(color: Colors.white, fontSize: 13.0),
//               ),
//             ),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pushNamed(context, '/medias');
//             },
//             child: Container(
//               child: const Text(
//                 'Medias',
//                 style: TextStyle(color: Colors.white, fontSize: 13.0),
//               ),
//             ),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pushNamed(context, '/favorits');
//             },
//             child: Container(
//               child: const Text(
//                 'Favorits',
//                 style: TextStyle(color: Colors.white, fontSize: 13.0),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);
// }

// class HomePage extends StatelessWidget {
//   @override
// //@override
//   Widget build(BuildContext context) {
//     final List<MediaItem> images = [];
//     Future<List<MediaItem>> loadData() async {
//       final String jsonData = await rootBundle.loadString('data.json');
//       final List<dynamic> raw = json.decode(jsonData);
//       return raw.map((json) => MediaItem.fromJson(json)).toList();
//     }

//     final List<MediaItem> series = [];
//     Future<List<MediaItem>> loadSeries() async {
//       final String jsonData = await rootBundle.loadString('series.json');
//       final List<dynamic> raw = json.decode(jsonData);
//       return raw.map((json) => MediaItem.fromJson(json)).toList();
//     }

//     return Scaffold(
//         appBar: SharedAppBar(),
//         body: Column(
//           children: [
//             FutureBuilder<List<MediaItem>>(
//               future: loadData(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   images.addAll(snapshot.data!);
//                   return Center(
//                     child: CarouselSlider(
//                       options: CarouselOptions(
//                         height: 200,
//                         aspectRatio: 16 / 9,
//                         viewportFraction: 0.7,
//                         initialPage: 0,
//                         enableInfiniteScroll: true,
//                         reverse: false,
//                         autoPlay: true,
//                         autoPlayInterval: Duration(seconds: 3),
//                         autoPlayAnimationDuration: Duration(milliseconds: 800),
//                       ),
//                       items: images.map((data) {
//                         return Builder(
//                           builder: (BuildContext context) {
//                             return Container(
//                               width: MediaQuery.of(context).size.width,
//                               margin: EdgeInsets.symmetric(horizontal: 5.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                                 children: [
//                                   Text(
//                                     data.title.toString(),
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       fontSize: 18.0,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Image.asset(
//                                       '/movies/${data.imageUrl}',
//                                       //fit: BoxFit.contain,
//                                       //width : 100
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         );
//                       }).toList(),
//                     ),
//                   );
//                 } else {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//               },
//             ),
//             FutureBuilder<List<MediaItem>>(
//               future: loadSeries(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   series.addAll(snapshot.data!);
//                   return Center(
//                     child: CarouselSlider(
//                       options: CarouselOptions(
//                         height: 200,
//                         aspectRatio: 16 / 9,
//                         viewportFraction: 0.7,
//                         initialPage: 0,
//                         enableInfiniteScroll: true,
//                         reverse: false,
//                         autoPlay: true,
//                         autoPlayInterval: Duration(seconds: 3),
//                         autoPlayAnimationDuration: Duration(milliseconds: 800),
//                       ),
//                       items: series.map((data) {
//                         return Builder(
//                           builder: (BuildContext context) {
//                             return Container(
//                               width: MediaQuery.of(context).size.width,
//                               margin: EdgeInsets.symmetric(horizontal: 5.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                                 children: [
//                                   Text(
//                                     data.title.toString(),
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       fontSize: 18.0,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Image.asset(
//                                       '/series/${data.imageUrl}',
//                                       //fit: BoxFit.contain,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         );
//                       }).toList(),
//                     ),
//                   );
//                 } else {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//               },
//             ),
//           ],
//         ));
//   }
// }

class CustomIconButton extends StatefulWidget {
  final MediaItem mediaItem;

  CustomIconButton({required this.mediaItem});

  @override
  _CustomIconButtonState createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  Color _buttonColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.favorite,
      ),
      color: _buttonColor,
      onPressed: () {
        setState(() {
          _buttonColor = Colors.red;
        });
        print('Liked ${widget.mediaItem.title}');
        // Add media item to favorites
        addToFavorites(widget.mediaItem);

        // Navigate to favorites page
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => FavoritsPage(favoritedMediaItems: [],)),
        // );
      },
    );
  }
}

// Define a list to store the favorite media items
List<MediaItem> favoriteMediaItems = [];

void addToFavorites(MediaItem mediaItem) {
  favoriteMediaItems.add(mediaItem);
}

// class MediasPage extends StatelessWidget {
//   Future<List<MediaItem>> loadData() async {
//     final String jsonData = await rootBundle.loadString('data.json');
//     final List<dynamic> raw = json.decode(jsonData);
//     return raw.map((json) => MediaItem.fromJson(json)).toList();
//   }

//   Future<List<MediaItem>> loadSeries() async {
//     final String jsonData = await rootBundle.loadString('series.json');
//     final List<dynamic> raw = json.decode(jsonData);
//     return raw.map((json) => MediaItem.fromJson(json)).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: SharedAppBar(),
//       body: FutureBuilder<List<MediaItem>>(
//         future: loadData(),
//         builder:
//             (BuildContext context, AsyncSnapshot<List<MediaItem>> snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//               padding: const EdgeInsets.all(8),
//               itemCount: snapshot.data!.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return GestureDetector(
//                   onTap: () {
//                     showModalBottomSheet(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return Container(
//                           height: 200,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: <Widget>[
//                               Text(
//                                 'Name: ${snapshot.data![index].title}',
//                                 style: TextStyle(
//                                     fontSize: 20, fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.left,
//                               ),
//                               Text(
//                                 'Description: ${snapshot.data![index].description}',
//                                 style: TextStyle(fontSize: 16),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     );
//                   },
//                   child: Card(
//                     child: Row(
//                       children: <Widget>[
//                         Container(
//                           width: 100,
//                           height: 100,
//                           child: Image.asset(
//                               '/movies/${snapshot.data![index].imageUrl}'),
//                         ),
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8),
//                             child: Text(snapshot.data![index].title),
//                           ),
//                         ),
//                         CustomIconButton(mediaItem: snapshot.data![index]),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Failed to load media data'));
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }

class MediasPage extends StatelessWidget {
  Future<List<MediaItem>> loadData() async {
    final String jsonData = await rootBundle.loadString('data.json');
    final List<dynamic> rawMovies = json.decode(jsonData);
    final List<MediaItem> movies =
        rawMovies.map((json) => MediaItem.fromJson(json)).toList();

    final String seriesData = await rootBundle.loadString('series.json');
    final List<dynamic> rawSeries = json.decode(seriesData);
    final List<MediaItem> series =
        rawSeries.map((json) => MediaItem.fromJson(json)).toList();

    // Combine both lists and return them
    return [...movies, ...series];
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
                          height: 800,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: 'Name: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: '${snapshot.data![index].title}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
                               RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: 'Genre: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: '${snapshot.data![index].genre}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: 'Date : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: '${snapshot.data![index].date_de_creation}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: 'Description: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: '${snapshot.data![index].description}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
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
                          child:
                              Image.asset('${snapshot.data![index].imageUrl}'),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(snapshot.data![index].title),
                          ),
                        ),
                        CustomIconButton(mediaItem: snapshot.data![index]),
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
  final String date_de_creation;
  final String genre;

  MediaItem(
      {required this.imageUrl, required this.title, required this.description, required this.date_de_creation, required this.genre});

  factory MediaItem.fromJson(Map<String, dynamic> json) {
    return MediaItem(
      imageUrl: json['image'],
      title: json['nom'],
      description: json['description'],
      date_de_creation: json['date_de_creation'],
      genre: json['genre'],
    );
  }
}

class FavoritsPage extends StatefulWidget {
  final List<MediaItem> favoritedMediaItems;

  FavoritsPage({required this.favoritedMediaItems});

  @override
  _FavoritsPageState createState() => _FavoritsPageState();
}

class _FavoritsPageState extends State<FavoritsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(),
      body: widget.favoritedMediaItems.isEmpty
          ? Center(
              child: Text('No favorites yet.'),
            )
          : ListView.builder(
              itemCount: widget.favoritedMediaItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: Image.asset(
                      '${widget.favoritedMediaItems[index].imageUrl}',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(widget.favoritedMediaItems[index].title),
                    subtitle:
                        Text(widget.favoritedMediaItems[index].description),
                  ),
                );
              },
            ),
    );
  }
}
