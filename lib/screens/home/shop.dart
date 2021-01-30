import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:grocery/models/stores.dart';
import 'package:grocery/screens/home/category_list.dart';
import 'package:grocery/screens/home/items.dart';
import 'package:grocery/screens/home/time_slot.dart';
import 'package:grocery/services/database.dart';
import 'package:grocery/shared/horizontal_time_picker.dart';
import 'package:provider/provider.dart';

class Shop extends StatelessWidget {
  bool _firstslot = false;
  Widget image_carousel = new Container( 
    height: 250.0,
    child: Carousel(
      boxFit:BoxFit.cover,
      images: [
        //Text('Fruits and Vegetables'),
        AssetImage('assets/images/fruits.jpg'),
        //Text('Supermarket'),
        AssetImage('assets/images/supermarket.jpg'),
        //Text('Pharmacy'),
        AssetImage('assets/images/Pharmacy.jpg'),
      ],
      autoplay: true,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds:1000),
      dotSize: 5.0,
      indicatorBgPadding: 3.0,
    ),
  );
  @override
  Widget build(BuildContext context) {
    String cate;
    String store_id;
    List<dynamic> shop_categories;
    List<dynamic> items_list;
    DateTime dt;
    List<dynamic>  listOfValue =  List<dynamic>(); 
    List<dynamic>  total_list =  List<dynamic>();

    final shop_list = Provider.of<List<Stores>>(context) ?? [];
      shop_list.forEach((category) { 
      cate = category.name;
      store_id = category.id;
      shop_categories = category.cat;
      items_list = category.itemslist;
      List<dynamic> maps = category.itemslist;       
      
      List<dynamic>  listOfKeys =  List<dynamic>(); 
      List<dynamic>  listOfValues =  List<dynamic>(); 
      for(var k=0;k<maps.length;k++)
      {  
      maps[k].forEach((k, v) => listOfValues.add(v));
      maps[k].forEach((k, v) => listOfKeys.add(k));
      }
      total_list = listOfKeys;
      listOfValue = listOfValues;
    });
    var orientation;
        return Container(
              child: Column(
                  children:<Widget>[
                    Container(
                    alignment:Alignment.center,
                    child:Text('Shop By Category',
                    style:TextStyle(
                      color:Colors.orangeAccent,
                      fontWeight:FontWeight.w500,
                      fontSize:15.0,
                    )),
                    ),
    
                    image_carousel,
    
                    Container(
                    alignment:Alignment.center,
                    child:Text('Stores near me',
                    style:TextStyle(
                      color:Colors.orangeAccent,
                      fontWeight:FontWeight.w500,
                      fontSize:15.0,
                    )),
                    ),
                    Expanded(
                      child:GridView.builder(
                        itemCount: shop_list.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: (orientation == Orientation.portrait) ? 2 : 2),
                    itemBuilder: (BuildContext context, int index) {
                  // GridView.count(
                  //   primary:false,
                  //   padding:const EdgeInsets.all(20),
                  //   crossAxisSpacing: 10,
                  //   mainAxisSpacing: 10,
                  //   crossAxisCount: 2,
                    return Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child:DecoratedBox(decoration: BoxDecoration(
                              border : Border.all(color: Colors.orangeAccent,width:10,),
                              
                            ), 
                            child :Column(
                              children: <Widget>[
                                Container(
                                  child:RaisedButton(
                                    color: Colors.orange,
                                    textColor: Colors.white,
                                    onPressed:(){
                                      print(dt);
                                      // Navigator.push(
                                      //           context,
                                      //           MaterialPageRoute(builder: (context) => Item_Screen(toolbarname: 'Fruits & Vegetables',)),
                                      //         );
                                      Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => Items(name : cate,store_id:store_id,shop_categories : shop_categories,items_list: total_list,price_list:listOfValue,dt:dt,)),
                                              );
                                              
                                      _firstslot = !_firstslot;
                                      print(_firstslot);
                                    },
                                    
                                     padding:const EdgeInsets.all(8),
                                      child:Text(cate,
                                      style:TextStyle(fontSize:15,
                                      )),
                                      ),
                                  
                                ),
                              
                              Container(
                                  child: Container(
                                  child: Container(
                                child : HorizontalTimePicker(
                                    key: UniqueKey(),
                                    startTimeInHour: 6,
                                    endTimeInHour: 13,
                                    timeIntervalInMinutes: 30,
                                    onTimeSelected: (dateTime) {
                                      //print(dateTime);
                                      dt = dateTime;
                                      print(dt);
                                    },
                                    //timeslot:widget.slot ?? [],
                                    dateForTime: DateTime.now(),
                                    selectedTimeTextStyle: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Helvetica Neue",
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      height: 1.0,
                                    ),
                                    timeTextStyle: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Helvetica Neue",
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      height: 1.0,
                                    ),
                                    defaultDecoration: const BoxDecoration(
                                      color: Colors.white,
                                      border: Border.fromBorderSide(BorderSide(
                                        color: Color.fromARGB(255, 151, 151, 151),
                                        width: 1,
                                        style: BorderStyle.solid,
                                      )),
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                    ),
                                    selectedDecoration: const BoxDecoration(
                                      color: Colors.black,
                                      border: Border.fromBorderSide(BorderSide(
                                        color: Color.fromARGB(255, 151, 151, 151),
                                        width: 1,
                                        style: BorderStyle.solid,
                                      )),
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                    ),
                                    disabledDecoration: const BoxDecoration(
                                      color: Colors.black26,
                                      border: Border.fromBorderSide(BorderSide(
                                        color: Color.fromARGB(255, 151, 151, 151),
                                        width: 1,
                                        style: BorderStyle.solid,
                                      )),
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                    ),
                                    showDisabled: true,
                                  )
                                ),
                                 ),
                            ),
                              ],
                            ),
                            )      
                      ),
                        ],
                    );
                    }
                      )
                    )
              
                    
                
                
              ],
            ),
            
        );
                          
                        
                      
      
  }
}


        

                         
                      
                    
                      
  
                      // Column(
                      //   children: <Widget>[
                      //     Padding(
                      //       padding: const EdgeInsets.all(12.0),
                      //       child:DecoratedBox(decoration: BoxDecoration(
                      //         border : Border.all(color: Colors.orangeAccent,width:10,),
                              
                      //       ), 
                      //       child :Column(
                      //         children: <Widget>[
                      //           Container(
                      //             child:RaisedButton(
                      //               onPressed:(){
                      //                 _firstslot = !_firstslot;
                      //                 print(_firstslot);
                      //               },
                      //               textColor: Colors.black,
                      //                padding:const EdgeInsets.all(8),
                      //                 child:Text('StoreName2',
                      //                 style:TextStyle(fontSize:15,
                      //                 )),
                      //                 ),
                                  
                      //           ),
                              
                      //         Container(
                      //             child: Container(
                      //           child : HorizontalTimePicker(
                      //               key: UniqueKey(),
                      //               startTimeInHour: 6,
                      //               endTimeInHour: 13,
                      //               timeIntervalInMinutes: 30,
                      //               onTimeSelected: (dateTime) {
                      //                 //print(dateTime);
                      //                 dt = dateTime;
                      //                 print(dt);
                      //               },
                      //               //timeslot:widget.slot ?? [],
                      //               dateForTime: DateTime.now(),
                      //               selectedTimeTextStyle: TextStyle(
                      //                 color: Colors.white,
                      //                 fontFamily: "Helvetica Neue",
                      //                 fontWeight: FontWeight.w300,
                      //                 fontSize: 16,
                      //                 height: 1.0,
                      //               ),
                      //               timeTextStyle: TextStyle(
                      //                 color: Colors.black,
                      //                 fontFamily: "Helvetica Neue",
                      //                 fontWeight: FontWeight.w300,
                      //                 fontSize: 16,
                      //                 height: 1.0,
                      //               ),
                      //               defaultDecoration: const BoxDecoration(
                      //                 color: Colors.white,
                      //                 border: Border.fromBorderSide(BorderSide(
                      //                   color: Color.fromARGB(255, 151, 151, 151),
                      //                   width: 1,
                      //                   style: BorderStyle.solid,
                      //                 )),
                      //                 borderRadius: BorderRadius.all(Radius.circular(5)),
                      //               ),
                      //               selectedDecoration: const BoxDecoration(
                      //                 color: Colors.black,
                      //                 border: Border.fromBorderSide(BorderSide(
                      //                   color: Color.fromARGB(255, 151, 151, 151),
                      //                   width: 1,
                      //                   style: BorderStyle.solid,
                      //                 )),
                      //                 borderRadius: BorderRadius.all(Radius.circular(5)),
                      //               ),
                      //               disabledDecoration: const BoxDecoration(
                      //                 color: Colors.black26,
                      //                 border: Border.fromBorderSide(BorderSide(
                      //                   color: Color.fromARGB(255, 151, 151, 151),
                      //                   width: 1,
                      //                   style: BorderStyle.solid,
                      //                 )),
                      //                 borderRadius: BorderRadius.all(Radius.circular(5)),
                      //               ),
                      //               showDisabled: true,
                      //             )
                      //           ),
                      //            ),
                      //         ],
                      //       ),
                      //       )      
                      // ),
                      //   ],
                      // ),
                      