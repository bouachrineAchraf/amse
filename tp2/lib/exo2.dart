import 'package:flutter/material.dart';
// import 'package:Taquin/util.dart';
import 'dart:math';

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
           Transform.scale(
            scale: _currentSliderthirdValue),
          // Container(
          //   clipBehavior: Clip.hardEdge,
          //   decoration: BoxDecoration(color: Colors.white),
          //   //color: Colors.black,
          //   // Transform.scale(
          // //   scale: _currentSliderthirdValue,
          //   child: 
          //   // Transform.scale(
          // //   scale: _currentSliderthirdValue,
          //   Transform(
          //     //alignment: Alignment.topRight,
          //     transform: Matrix4.identity()
          //       ..rotateZ(_currentSliderSecondaryValue)
          //       ..rotateX(_currentSliderPrimaryValue),
          //      // ..rotateY(_currentSliderthirdValue),
          //     child: Container(
          //      // padding: const EdgeInsets.all(8.0),
          //       //color: const Color(0xFFE8581C),
                
          //       child: Image(
          //         image: NetworkImage('https://picsum.photos/512/1024'),
          //         width: 100,
          //         height: 150,
          //       ),
          //     ),
          //   ),
          // ),
          Transform.scale(
            scale: _currentSliderthirdValue,
            child: Transform.rotate(
              angle: _currentSliderPrimaryValue,
              child: Transform.rotate(
                angle: _currentSliderSecondaryValue,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: const Color(0xFFE8581C),
                  child: Image(
                    image: NetworkImage('https://picsum.photos/512/1024'),
                    width: 100,
                    height: 150,
                  ),
                ),
              ),
            ),
          ),
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
