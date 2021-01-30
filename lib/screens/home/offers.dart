import 'package:flutter/material.dart';

class Offers extends StatefulWidget {
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
       decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.yellow, Colors.blueAccent])),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'No Current Offers',

                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              ),
            ],
          ),
        ),
    );
  }
}