import 'package:flutter/material.dart';
import 'package:flutter_counter/flutter_counter.dart';

class Couter_Item extends StatefulWidget {
  @override
  _Couter_ItemState createState() => _Couter_ItemState();
}

class _Couter_ItemState extends State<Couter_Item> {
   num _counter = 0;
  num _defaultValue = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Callback from the counter control: $_counter',
            ),
            Counter(
              initialValue: _defaultValue,
              minValue: 0,
              maxValue: 10,
              step: 1.0,
              decimalPlaces: 1,
              onChanged: (value) {
                setState(() {
                  _defaultValue = value;
                  _counter = value;
                });
              },
            ),
          ],
        ),
      );
  }
}