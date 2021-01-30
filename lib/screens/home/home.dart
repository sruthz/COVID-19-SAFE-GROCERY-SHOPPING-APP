import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/models/brew.dart';
import 'package:grocery/models/stores.dart';
import 'package:grocery/screens/home/account.dart';
import 'package:grocery/screens/home/brew_list.dart';
import 'package:grocery/screens/home/cart.dart';
import 'package:grocery/screens/home/favorite.dart';
//import 'package:grocery/screens/home/example.dart';
import 'package:grocery/screens/home/home_page.dart';
import 'package:grocery/screens/home/items.dart';
import 'package:grocery/screens/home/location.dart';
import 'package:grocery/screens/home/offers.dart';
import 'package:grocery/screens/home/settings_form.dart';
import 'package:grocery/screens/home/shop.dart';
import 'package:grocery/screens/home/store_list.dart';
import 'package:grocery/screens/home/time_slot.dart';
import 'package:grocery/services/auth.dart';
import 'package:grocery/services/database.dart';
import 'package:provider/provider.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:geolocator/geolocator.dart';
import 'package:simple_search_bar/simple_search_bar.dart';



class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  String _selectedValue = '';

  GlobalKey _bottomNavigationKey = GlobalKey();
  int _page = 0;

  final List<Widget> _children = [
    BottomNavBar(),
    Shop(),
    Offers(),
    Favorite(),
    Account(),
  ];
  

//   void yourFunction() async {
//   final coordinates = new Coordinates(latitude, longitude);
//   var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);

//   var first = addresses.first; 
//   print("${first.featureName} : ${first.addressLine}");
// }

  @override
  Widget build(BuildContext context) {
    
     final AppBarController appBarController = AppBarController();
    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (conetext){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
          child: Location_Bottom(),
        );
      });
    }
    return StreamProvider<List<Stores>>.value(
          value : DatabaseService().stores,
          child: StreamProvider<List<Brew>>.value(
            value: DatabaseService().brews,
            child:Scaffold(
              
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: false,
        appBar: SearchAppBar(
        //statusBarColor:Colors.red,
        //primary: Theme.of(context).primaryColor,
        appBarController: appBarController,
        // You could load the bar with search already active
        autoSelected: false,
        primary :Colors.red,
        searchHint: "Search...",
        mainTextColor: Colors.white,
        onChange: (String value) {
              //Your function to filter list. It should interact with
              //the Stream that generate the final list
        },  
        //Will show when SEARCH MODE wasn't active
        mainAppBar: AppBar(
              flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              Colors.orange,
              Colors.yellow,
              Colors.red
            ])          
         ),        
     ),     
              //backgroundColor: Colors.red,
              title: Text("Shop@Home"),
              actions: <Widget>[
                Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: InkWell(
                  child: Icon(
                    Icons.search,
                  ),
                  
                  onTap: () {
                    //This is where You change to SEARCH MODE. To hide, just
                    //add FALSE as value on the stream
                    appBarController.stream.add(true);
                  },

                ),
    ),
                Padding(
      padding: EdgeInsets.only(right: 20.0),
      child:
                InkWell(
                  child: Icon(
                    Icons.notifications,
                  ),
                  onTap: ()async
                  {
                    
                    await _auth.signOut();
                  
                  },
                ),
                ),
              ],
        ),
        ),
              
        // appBar: AppBar(
        //   title: Text('Grocery'),
        //   backgroundColor: Colors.red,
        //   elevation: 0.0,
        //   actions : <Widget>[
        //     FlatButton.icon(
        //       onPressed: () 
                  // async
                  // {
                  //   await _auth.signOut();
                  //   //_getCurrentLocation();
                  // }, 
        //       icon: Icon(Icons.person), 
        //       label: Text('logout'),
        //       ),
        //     FlatButton.icon(
        //       onPressed: (){
        //         _showSettingsPanel();
        //       }, 
        //       icon: Icon(Icons.settings),
        //       label : Text('Settings'),
        //       ),
        //   ],
        // ),
        bottomNavigationBar: CurvedNavigationBar(
              key: _bottomNavigationKey,
              index: 0,
              height: 50.0,
              items: <Widget>[
                Icon(Icons.home, size: 30, color: Colors.white),
                Icon(Icons.store, size: 30, color: Colors.white),
                Icon(Icons.local_offer, size: 30, color: Colors.white),
                Icon(Icons.favorite, size: 30, color: Colors.white),
                Icon(Icons.person, size: 30, color: Colors.white),
              ],
              color: Colors.red,
              buttonBackgroundColor: Colors.red,
              backgroundColor: Colors.white,
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 600),
              onTap: (index) {
                setState(() {
                  _page = index;
                });
              },
              ),
        body:Container(
              child: _children[_page],
//           child : Column(
//             children: <Widget>[
//               Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: <Widget>[
//       DatePicker(
//         DateTime.now(),
//         initialSelectedDate: DateTime.now(),
//         selectionColor: Colors.black,
//         selectedTextColor: Colors.white,
//         onDateChange: (date) { 
//           setState(() {
//             _selectedValue = date.toString();
//           });
//         },
//       ),
//     ],
// ),
//               Container(
//                 child:StoreList(),
//               ),
//               //Container(child: TimeSlot(),),
                 
//             ],
//           ),
              
              
              
              ),
      )
          )
    );
            
  }
}