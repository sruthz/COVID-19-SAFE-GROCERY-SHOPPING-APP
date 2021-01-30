


import 'dart:collection';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:grocery/models/stores.dart';
import 'package:grocery/screens/home/cart.dart';
import 'package:grocery/screens/home/category_list.dart';
import 'package:grocery/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Items extends StatefulWidget {
  String name;
  String store_id;
  List<dynamic> shop_categories;
  List<dynamic> items_list;
  List<dynamic> price_list;
  DateTime dt;
  Items({this.name,this.store_id,this.shop_categories,this.items_list,this.price_list,this.dt});
  
  @override
  _ItemsState createState() => _ItemsState();
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }
class _ItemsState extends State<Items> {
 
  Map<String,int> cart_list = new HashMap();
  Map<String,int> cart_prices_list = new HashMap();
 var _counter = new List<dynamic>.generate(10, (i) => 0);
  var url;
  Future getURL() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    StorageReference storageRef = await storage.getReferenceFromUrl("gs://covid-grocery.appspot.com");

    // Create a reference to "file"
    StorageReference mountainsRef = storageRef.child('Items_Images/Lemon(1kg).jpg');
    url = await mountainsRef.getDownloadURL();
    print(url);
  }
  final _controller = ScrollController();
  final _height = 100.0;
  
  @override
  Widget build(BuildContext context) {
    _animateToIndex(i) => _controller.animateTo(_height * i, duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);
    
    void _showBottomPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
          child: Text(widget.name),
        );
      });
    }
    //List<dynamic> m = widget.items_list[0].keys.toList();
    final orientation = MediaQuery.of(context).orientation;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text(widget.name),
            actions: <Widget>[
                // action button
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    //getURL();
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cart(cart_list : cart_list,name : widget.name,store_id:widget.store_id,cart_prices_list : cart_prices_list, dt:widget.dt)),
                  );
                  },
                ),
            ],
          ),
          body: GridView.builder(
                    itemCount: widget.items_list.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
                    itemBuilder: (BuildContext context, int index) {
                      return new Card(
                                child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      
                      children: [
                        CachedNetworkImage(
                          width: 200,
                          height: 120,
                            imageUrl: 'https://firebasestorage.googleapis.com/v0/b/covid-grocery.appspot.com/o/Items_Images%2F'+widget.items_list[index]+'.jpg?alt=media',
                            placeholder: (context,url) => CircularProgressIndicator(),
                            errorWidget: (context,url,error) => new Icon(Icons.error),
                          ),
                        Container(child: Padding(
                          padding: const EdgeInsets.only(left:12),
                          child: Column(
                            children: <Widget>[
                              new Text(widget.items_list[index].toString(),
                              textScaleFactor: 1,),
                              new Text('Rs : ' + widget.price_list[index].toString(),
                              textScaleFactor: 1,),
                            ],
                          ),
                        ),
                        ),
                        Expanded(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left:45.0),
                              child: Row(
                
                                children: <Widget>[
                                  new Container(
                                    height: 40,
                                    child: new IconButton(
                                      icon: new Icon(Icons.remove),
                                      highlightColor: Colors.green,
                                      onPressed: (){
                                        setState(() {
                                          String l = widget.items_list[index];
                                          //cart_list[l]=0;
                                          print(cart_list);
                                          if(cart_list.containsKey(l))
                                          {
                                            if(cart_list[l]>0)
                                            cart_list[l]--;
                                            if(cart_list[l]==0)
                                            cart_list.remove(l);
                                            cart_prices_list.remove(l);
                                          }
                                          
                                          print(cart_list);
                                          });
                                      },
                                    ),
                                  ),
                              
                              new Container(
                                
                                child: new Text(cart_list[widget.items_list[index]].toString()=='null' ? '0' : cart_list[widget.items_list[index]].toString(),
                                style: Theme.of(context).textTheme.subtitle1,),
                              ),
                              new Container( 
                                child: new IconButton(
                                  icon: new Icon(Icons.add),
                                  highlightColor: Colors.green,
                                  onPressed: (){
                                    setState(() {
                                      String l = widget.items_list[index];
                                      //cart_list[l]=0;
                                      print(cart_list);
                                      if(cart_list.containsKey(l))
                                      {
                                        cart_list[l]++;
                                      }
                                      else
                                      {
                                        cart_list[l] = 1;
                                        cart_prices_list[l] = int.parse(widget.price_list[index]);
                                      }
                                      print(cart_list);
                                      });
                                  },
                                ),
                              ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                                ),
    );
  },
),
      
      // ListView.builder(
      //   itemBuilder: (context, j) {
      //     return Padding(
      //       padding: EdgeInsets.symmetric(vertical: 16.0),
      //       child: Column(
      //         children: <Widget>[
      //           Text(
      //             widget.shop_categories[j],
      //             style: Theme.of(context).textTheme.body2,
      //           ),
      //           ListView.builder(
      //             itemBuilder: (context, index) {
                    // return new Card(
                    //             child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     Container(child: Padding(
                    //       padding: const EdgeInsets.only(left:12),
                    //       child: new Text(widget.items_list[j].keys.toList()[index].toString(),
                    //       textScaleFactor: 1.5,),
                    //     ),
                    //     width: 250.0),
                    //     new Container(
                    //       child: new IconButton(
                    //         icon: new Icon(Icons.remove),
                    //         highlightColor: Colors.green,
                    //         onPressed: (){
                    //           setState(() {
                    //             String l = widget.items_list[j].keys.toList()[index];
                    //             //cart_list[l]=0;
                    //             print(cart_list);
                    //             if(cart_list.containsKey(l))
                    //             {
                    //               if(cart_list[l]>0)
                    //               cart_list[l]--;
                    //               if(cart_list[l]==0)
                    //               cart_list.remove(l);
                    //             }
                                
                    //             print(cart_list);
                    //             });
                    //         },
                    //       ),
                    //     ),
                    //     new Container(
                    //       child: new Text(cart_list[widget.items_list[j].keys.toList()[index]].toString()=='null' ? '0' : cart_list[widget.items_list[j].keys.toList()[index]].toString(),
                    //       style: Theme.of(context).textTheme.display1,),
                    //     ),
                    //     new Container( 
                    //       child: new IconButton(
                    //         icon: new Icon(Icons.add),
                    //         highlightColor: Colors.green,
                    //         onPressed: (){
                    //           setState(() {
                    //             String l = widget.items_list[j].keys.toList()[index];
                    //             //cart_list[l]=0;
                    //             print(cart_list);
                    //             if(cart_list.containsKey(l))
                    //             {
                    //               cart_list[l]++;
                    //             }
                    //             else
                    //             {
                    //               cart_list[l] = 1;
                    //             }
                    //             print(cart_list);
                    //             });
                    //         },
                    //       ),
                    //     ),
      //                 ]
      //               ),
      //               );
                   
      //             },
      //             itemCount: widget.items_list[j].length,
      //             shrinkWrap: true, // todo comment this out and check the result
      //             physics: ClampingScrollPhysics(), // todo comment this out and check the result
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      //   itemCount: widget.items_list.length,
      // ),
            floatingActionButton: Category(shop_categories: widget.shop_categories,),
     
    );
  }
}

  //     body: ListView.builder(
  //                               itemCount: 2,
  //                     itemBuilder: (context, j){
  //                       new ListView.builder(
  //                     itemCount: widget.items_list[j].length,
  //                     shrinkWrap: true,
  //                     itemBuilder: (context, i) {
                    //     return new Card(
                    //             child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     new Text(widget.items_list[0].values.toList()[i]),
                    //     new Container(
                    //       child: new IconButton(
                    //         icon: new Icon(Icons.remove),
                    //         highlightColor: Colors.green,
                    //         onPressed: (){
                    //           setState(() {
                    //               if (_counter[i] > 0) {
                    //                 _counter[i]--;
                    //               }
                    //             });
                    //            // _removeProduct();
                    //         },
                    //       ),
                    //     ),
                    //     new Container(
                    //       child: new Text('${_counter[i]}',
                    //       style: Theme.of(context).textTheme.display1,),
                    //     ),
                    //     new Container( 
                    //       child: new IconButton(
                    //         icon: new Icon(Icons.add),
                    //         highlightColor: Colors.green,
                    //         onPressed: (){
                    //           setState(() {
                    //               _counter[i]++;
                    //             });
                    //            // _addProduct();
                    //         },
                    //       ),
                    //     ),
                    //     // new Container( 
                    //     //   padding: new EdgeInsets.all(10.0),
                    //     //   width: 100.0,
                    //     //   child: new RaisedButton(
                    //     //     padding: const EdgeInsets.all(8.0),
                    //     //     textColor: Colors.white,
                    //     //     color: Colors.green,
                    //     //     onPressed: (){
                    //     //       setState(() {
                    //     //           if (_counter > 0) {
                    //     //             _counter--;
                    //     //           }
                    //     //         });
                    //     //     },//_addNumbers,
                    //     //     child: new Text("Add"),
                    //     //   ),
                    //     // ),
                    //   ]
                    // ),
  //           //       ]
  //           //     ),
  //           //   ],
  //           // )
  //   );
  // },
  //           );
  // }
  //         ),
        
      
      // ListView(
      //   children: ListTile.divideTiles(
      //     context: context,
      //     tiles: [
      //       ListTile(
      //         title: Text('Fruits & Vegetables'),
      //         trailing: new Row(
      //         children: <Widget>[
      //           _itemCount!=0? new  IconButton(icon: new Icon(Icons.remove),onPressed: ()=>setState(()=>_itemCount--),):new Container(),
      //             new Text(_itemCount.toString()),
      //             new IconButton(icon: new Icon(Icons.add),onPressed: ()=>setState(()=>_itemCount++))
      //         ],
      //       ),
      //       ),
      //       ListTile(
      //         title: Text('Foodgrains, Oil & Masala'),
      //       ),
      //       ListTile(
      //         title: Text('Beverages'),
      //       ),
      //        ListTile(
      //         title: Text('Bakery, Cakes & Diary'),
      //       ),
      //       ListTile(
      //         title: Text('Snacks & Branded Foods'),
      //       ),
      //       ListTile(
      //         title: Text('Kitchen'),
      //       ),
      //        ListTile(
      //         title: Text('Cleaning & Household'),
      //       ),
      //       ListTile(
      //         title: Text('Beauty & Hygiene'),
      //       ),
      //       ListTile(
      //         title: Text('Baby Care'),
      //       ),
      //        ListTile(
      //         title: Text('Gourmet & World Food'),
      //       ),
      //       ListTile(
      //         title: Text('Medicines'),
      //       ),
      //       ListTile(
      //         title: Text('Pets & Gardens'),
      //       ),
      //     ],
      //   ).toList(),
      // ),

 // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () { 
      //      _showBottomPanel();
      //   },
      //   label: Text('Menu'),
      //   icon: Icon(Icons.menu),
      //   backgroundColor: Colors.red,
      // ),
 // return Padding(
                    //   padding: EdgeInsets.symmetric(
                    //     horizontal: 16.0,
                    //     vertical: 8.0,
                    //   ),
                    //   child: Text(
                    //     widget.items_list[j].values.toList()[index],
                    //     style: Theme.of(context).textTheme.body1,
                    //   ),
                    // );



                   // Image.network('https://firebasestorage.googleapis.com/v0/b/covid-grocery.appspot.com/o/'+widget.items_list[0].keys.toList()[index]+'.jpg?alt=media',fit: BoxFit.cover,
                        //     loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                        //     if (loadingProgress == null) return child;
                        //       return Center(
                        //         child: CircularProgressIndicator(
                        //         value: loadingProgress.expectedTotalBytes != null ? 
                        //               loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                        //               : null,
                        //         ),
                        //       );
                        //     },
                        //   ),
                        //Image.network('https://firebasestorage.googleapis.com/v0/b/covid-grocery.appspot.com/o/'+widget.items_list[0].keys.toList()[index]+'?alt=media') == null ? Image.asset('assests/images/lemon.png') : Image.network('https://firebasestorage.googleapis.com/v0/b/covid-grocery.appspot.com/o/'+widget.items_list[0].keys.toList()[index]+'?alt=media'),
                        