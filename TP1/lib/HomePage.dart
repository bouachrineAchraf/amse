import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'SharedAppBar.dart';
import 'package:flutter/services.dart';

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

class HomePage extends StatelessWidget {
  @override
//@override
  Widget build(BuildContext context) {
    final List<MediaItem> images = [];
    Future<List<MediaItem>> loadData() async {
      final String jsonData = await rootBundle.loadString('data.json');
      final List<dynamic> raw = json.decode(jsonData);
      return raw.map((json) => MediaItem.fromJson(json)).toList();
    }

    final List<MediaItem> series = [];
    Future<List<MediaItem>> loadSeries() async {
      final String jsonData = await rootBundle.loadString('series.json');
      final List<dynamic> raw = json.decode(jsonData);
      return raw.map((json) => MediaItem.fromJson(json)).toList();
    }

    return Scaffold(
        appBar: SharedAppBar(),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                FutureBuilder<List<MediaItem>>(
                  future: loadData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      images.addAll(snapshot.data!);
                      return Column(children: [
                        Padding(
                          padding: EdgeInsets.only(top: 40.0),
                          child: Text(
                            "FILMS",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 200,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.7,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                          ),
                          items: images.map((data) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        data.title.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Expanded(
                                        child: Image.asset(
                                          '${data.imageUrl}',
                                          fit: BoxFit
                                              .cover, // or BoxFit.fitWidth
                                          width: double
                                              .infinity, // optional: to make the image as wide as its parent
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ]);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                FutureBuilder<List<MediaItem>>(
                  future: loadSeries(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      series.addAll(snapshot.data!);
                      return Column(children: [
                        Padding(
                          padding: EdgeInsets.only(top: 40.0),
                          child: Text(
                            "SERIES",
                            textAlign: TextAlign.center,
                            style: TextStyle(                    
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 200,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.7,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                          ),
                          items: series.map((data) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        data.title.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Expanded(
                                        child: Image.asset(
                                          '${data.imageUrl}',
                                          fit: BoxFit
                                              .cover, // or BoxFit.fitWidth
                                          width: double.infinity,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ]);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            )));
  }
}
