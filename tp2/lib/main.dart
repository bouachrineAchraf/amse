import 'package:flutter/material.dart';
import 'dart:math';
import 'exo1.dart' as exo1;
import 'exo2.dart' as exo2;
import 'exo4.dart' as exo4;
import 'exo5.dart' as exo5;
import 'exo5b.dart' as exo5b;
import 'exo6.dart' as exo6;
import 'exo6b.dart' as exo6b;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MenuPage());
  }
}

class Exo {
  final String title;
  final String subtitle;
  final WidgetBuilder buildFunc;

  const Exo(
      {required this.title, required this.subtitle, required this.buildFunc});
}

List exos = [
  Exo(
      title: 'Exercice 1',
      subtitle: 'Simple image',
      buildFunc: (context) => exo1.DisplayImageWidget()),
  Exo(
      title: 'Exercice 2',
      subtitle: 'Rotate&Scale image',
      buildFunc: (context) => exo2.DisplayImageWidget()),
  Exo(
      title: 'Exercice 4',
      subtitle: 'Affichage d une tuile',
      buildFunc: (context) => exo4.DisplayTileWidget()),
  Exo(
      title: 'Exercice 5a',
      subtitle: 'Génération du plateau de tuiles',
      buildFunc: (context) => exo5.DisplayImageWidget()),
  Exo(
      title: 'Exercice 5b',
      subtitle: 'Génération du plateau de tuiles',
      buildFunc: (context) => exo5b.DisplayImageWidget()),
  Exo(
      title: 'Exercice 6',
      subtitle: 'Génération du plateau de tuiles',
      buildFunc: (context) => exo6.PositionedTiles()),
  Exo(
      title: 'Exercice 6b',
      subtitle: 'Génération du plateau de tuiles',
      buildFunc: (context) => exo6b.PositionedTiles()),
];

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TP2'),
        ),
        body: ListView.builder(
            itemCount: exos.length,
            itemBuilder: (context, index) {
              var exo = exos[index];
              return Card(
                  child: ListTile(
                      title: Text(exo.title),
                      subtitle: Text(exo.subtitle),
                      trailing: Icon(Icons.play_arrow_rounded),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: exo.buildFunc),
                        );
                      }));
            }));
  }
}

class SliderApp extends StatelessWidget {
  const SliderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SliderExample(),
    );
  }
}

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _currentSliderPrimaryValue = 0;
  double _currentSliderSecondaryValue = 0;
  double _currentSliderthirdValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider')),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Transform.scale(scale: _currentSliderthirdValue),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(color: Colors.white),
            //color: Colors.black,
            // Transform.scale(
            //   scale: _currentSliderthirdValue,
            child:
                // Transform.scale(
                //   scale: _currentSliderthirdValue,
                Transform(
              //alignment: Alignment.topRight,
              transform: Matrix4.identity()
                ..rotateZ(_currentSliderSecondaryValue)
                ..rotateX(_currentSliderPrimaryValue),
              // ..rotateY(_currentSliderthirdValue),
              child: Container(
                // padding: const EdgeInsets.all(8.0),
                //color: const Color(0xFFE8581C),

                child: Image(
                  image: NetworkImage('https://picsum.photos/512/1024'),
                  width: 100,
                  height: 150,
                ),
              ),
            ),
          ),
          // Transform.scale(
          //   scale: _currentSliderthirdValue,
          //   child: Transform.rotate(
          //     angle: _currentSliderPrimaryValue,
          //     child: Transform.rotate(
          //       angle: _currentSliderSecondaryValue,
          //       child: Container(
          //         padding: const EdgeInsets.all(8.0),
          //         color: const Color(0xFFE8581C),
          //         child: Image(
          //           image: NetworkImage('https://picsum.photos/512/1024'),
          //           width: 100,
          //           height: 150,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Slider(
            value: _currentSliderPrimaryValue,
            max: 2 * pi,
            label: _currentSliderPrimaryValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderPrimaryValue = value;
              });
            },
          ),
          Slider(
            value: _currentSliderSecondaryValue,
            max: 2 * pi,
            label: _currentSliderSecondaryValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderSecondaryValue = value;
              });
            },
          ),
          Slider(
            value: _currentSliderthirdValue,
            max: 10,
            label: _currentSliderthirdValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderthirdValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('Slider')),
  //     body: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[

  //         Transform.rotate(
  //           angle: _currentSliderPrimaryValue,
  //           child: Container(
  //             padding: const EdgeInsets.all(8.0),
  //             color: const Color(0xFFE8581C),
  //             child: Image(
  //             image: NetworkImage('https://picsum.photos/512/1024'),
  //             width: 200,
  //             height: 300,
  //             ),
  //           ),
  //         ),

  //         Transform.scale(
  //           scale: _currentSliderSecondaryValue,
  //           child: Container(
  //             padding: const EdgeInsets.all(8.0),
  //             color: const Color(0xFFE8581C),
  //             child: Image(
  //             image: NetworkImage('https://picsum.photos/512/1024'),
  //             width: 20,
  //             height: 30,
  //             ),
  //           ),
  //         ),

  //         Slider(
  //           value: _currentSliderPrimaryValue,
  //           max: 2 * pi,
  //           //min: 0,
  //           //rsecondaryTrackValue: _currentSliderSecondaryValue,
  //           label: _currentSliderPrimaryValue.round().toString(),
  //           onChanged: (double value) {
  //             setState(() {
  //               _currentSliderPrimaryValue = value;
  //             });
  //           },
  //         ),
  //         Slider(
  //           value: _currentSliderSecondaryValue,
  //           max: 3,
  //           //min: 0,
  //           label: _currentSliderSecondaryValue.round().toString(),
  //           onChanged: (double value) {
  //             setState(() {
  //               _currentSliderSecondaryValue = value;
  //             });
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }
}


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(title: const Text('Slider')),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Slider(
//             value: _currentSliderPrimaryValue,
//             secondaryTrackValue: _currentSliderSecondaryValue,
//             label: _currentSliderPrimaryValue.round().toString(),
//             onChanged: (double value) {
//               setState(() {
//                 _currentSliderPrimaryValue = value;
//               });
//             },
//           ),
//           Slider(
//             value: _currentSliderSecondaryValue,
//             label: _currentSliderSecondaryValue.round().toString(),
//             onChanged: (double value) {
//               setState(() {
//                 _currentSliderSecondaryValue = value;
//               });
//             },
//           ),
//         ],
//       ),
//     );
//     // return MaterialApp(
//     //   home: Image.network('https://picsum.photos/512/1024',
//     //   loadingBuilder: (context, child, progress) {
//     //     return progress == null ? child : LinearProgressIndicator();
//     //   },
//     //   ),
//     // );
//   }
// }

