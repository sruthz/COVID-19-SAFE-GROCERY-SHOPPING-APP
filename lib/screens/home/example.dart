import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
      colors: [const Color(0xFFFFFFEE), const Color(0xFF999999)], // whitish to gray
      tileMode: TileMode.repeated, // repeats the gradient over the canvas
    ),
  ),
);
  }
}