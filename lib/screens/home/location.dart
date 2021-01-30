import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class Location_Bottom extends StatefulWidget {
  @override
  _Location_BottomState createState() => _Location_BottomState();
}

class _Location_BottomState extends State<Location_Bottom> {
String country;
  String locality;
  
  void _getCurrentLocation() async{
    final position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);
    print(position.latitude);
    setState(() {
      country = placemark[0].country;
    locality = placemark[0].locality;
    });
    
    
  }
  @override
  void initState(){
    _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Text(
  'You are in ${country ?? ''} and ${locality ?? ''}',
  textAlign: TextAlign.center,
  overflow: TextOverflow.ellipsis,
  style: TextStyle(fontWeight: FontWeight.bold),
)
    );
  }
}