import 'package:flutter/material.dart';
import 'package:grocery/models/stores.dart';
import 'package:grocery/screens/home/brew_tile.dart';
import 'package:grocery/screens/home/store_tile.dart';

import 'package:provider/provider.dart';

class StoreList extends StatefulWidget {
  @override
  _StoreListState createState() => _StoreListState();
}

class _StoreListState extends State<StoreList> {
 
  @override
  Widget build(BuildContext context) {

    final brews = Provider.of<List<Stores>>(context) ?? [];
    brews.forEach((brew) { 
      print(brew.name);
      print(brew.area);
      print(DateTime.now());
    });
    //print(brews.documents);
    return Container(
      height: 400.0,
      child: ListView.builder(
        
        itemCount: brews.length,
        itemBuilder: (context, index) {
          return StoreTile(store: brews[index]);
        },
        ),
    );
  }
}