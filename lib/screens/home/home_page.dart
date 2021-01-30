import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';
import 'package:grocery/screens/home/location.dart';
import 'package:grocery/screens/home/store_list.dart';
void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  // void _getCurrentLocation() async{
  //   final position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //   List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);
  //   print(position.latitude);
  //   print(placemark[0].country);
  //   print(placemark[0].locality);
  // }

  void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (conetext){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
          child: Location_Bottom(),
        );
      });
    }
     
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
     double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          SizedBox(
            width: _width,
            child: RaisedButton(
              color: Colors.orange,
              textColor: Colors.white,

              onPressed: () {
                //_getCurrentLocation();
                 _showSettingsPanel();
              },
              child: Padding(
                padding: const EdgeInsets.only(left:100),
                child: Row( // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      Text('Your Location', style: TextStyle(fontSize: 20)),
                      Icon(Icons.location_on),
                    
                    ],
                  ),
              ),
              //child: const Text('Your Location', style: TextStyle(fontSize: 20)),
            ),
          ),
          new Container(
            
    child: SizedBox(
          height: 300.0,
          width: 600,
          child: Carousel(
            boxFit: BoxFit.cover,
            autoplay: true,
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: Duration(milliseconds: 1000),
            dotSize: 6.0,
            dotIncreasedColor: Color(0xFFFF335C),
            dotBgColor: Colors.transparent,
            dotPosition: DotPosition.bottomCenter,
            dotVerticalPadding: 10.0,
            showIndicator: true,
            indicatorBgPadding: 7.0,
            images: [
              AssetImage('assets/sp1.jpg'),
          AssetImage('assets/sp2.jpg'),
          AssetImage('assets/sp3.jfif'),
          AssetImage('assets/sp4.jpg'),
            ],
          ),
        ),
          ),//Container(child:StoreList(), ),
          
          ],
      ),
      
    );
  }
}






  