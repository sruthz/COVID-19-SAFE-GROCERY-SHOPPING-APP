import 'package:flutter/material.dart';
import 'package:grocery/models/stores.dart';
import 'package:grocery/screens/home/time_slot.dart';

class StoreTile extends StatefulWidget {
  
  final Stores store;
  StoreTile({this.store});

  @override
  _StoreTileState createState() => _StoreTileState();
}

class _StoreTileState extends State<StoreTile> {
  bool _showTimeSlot = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: Column(
        children:<Widget>[ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[100],
            backgroundImage: AssetImage('assets/coffee_icon.png'),
          ),
          title: Text(widget.store.name + ' ' + widget.store.id),
          subtitle: Text('In ${widget.store.area} Area' + widget.store.slot.toString()),
          onTap: () {
             _showTimeSlot = !_showTimeSlot;
             print( _showTimeSlot);
             


          },
        ),
      
      Container(
        child: TimeSlot(slot: widget.store.slot),
      ),
      ],
      )
      )
      );
  }
}