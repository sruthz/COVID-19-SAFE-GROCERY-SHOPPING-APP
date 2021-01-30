import 'package:flutter/material.dart';
import 'package:fab_menu_items/fab_menu_items.dart';
import 'items.dart';
class Category extends StatefulWidget {
   List<dynamic> shop_categories;
   Category({this.shop_categories});
  @override
  _CategoryState createState() => _CategoryState();
}

 

class _CategoryState extends State<Category> {

  List _listings = new List();

  List<Widget> _getListings() { // <<<<< Note this change for the return type
    List listings = new List<Widget>();
    int i = 0;
    for (i = 0; i < widget.shop_categories.length; i++) {
      listings.add(
        Container(
              padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 2),
              alignment: Alignment.centerLeft,
              child: RaisedButton(
                      child : Row(
                        children: <Widget>[
                          IconButton(
                    icon: Icon(Icons.check_circle),
                    color: Colors.indigo, onPressed: () { print('ello'); },
                    ),
                          Expanded(
                            child: Text(widget.shop_categories[i],
                  style: TextStyle(
                            color: Colors.black54,fontSize: 12,fontWeight: FontWeight.w500
                  )
                  ),
                          ),
                        ],
                      ), onPressed: () { },))
                
              
            
            
      );
    }
     return listings;
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children : <Widget>[
        Fabmenuitems(
          height: 310,
          weith: 200,
          animatedIcons: AnimatedIcons.menu_close,
          fabcolor: Colors.red,
          containercolor: Colors.white,
          childrens: _getListings(),
          // <Widget>[
            // Container(
            //   padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 2),
            //   alignment: Alignment.centerLeft,
            //   child: Row(
            //     children: <Widget>[
            //       Icon(Icons.check_circle_outline,size: 24,color: Colors.indigo,),
            //       SizedBox(width: 10,),
            //       Expanded(child: Text("Fruits & Vegetables",style: TextStyle(
            //           color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w500
            //       ),))
            //     ],
            //   ),
            // ),
            // Divider(),

          //   Container(
          //     padding: EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
          //     alignment: Alignment.centerLeft,
          //     child: Row(
          //       children: <Widget>[
          //         Icon(Icons.check_circle_outline,size: 24,color: Colors.indigo,),
          //         SizedBox(width: 10,),
          //         Expanded(child: Text("Foodgrains, Oil & Masala",style: TextStyle(
          //             color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w500
          //         ),))
          //       ],
          //     ),
          //   ),
          //   Divider(),

          //   Container(
          //     padding: EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
          //     alignment: Alignment.centerLeft,
          //     child: Row(
          //       children: <Widget>[
          //         Icon(Icons.check_circle_outline,size: 24,color: Colors.indigo,),
          //         SizedBox(width: 10,),
          //         Expanded(child: Text("Beverages",style: TextStyle(
          //             color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w500
          //         ),))
          //       ],
          //     ),
          //   ),
          //   Divider(),

          //   Container(
          //     padding: EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
          //     alignment: Alignment.centerLeft,
          //     child: Row(
          //       children: <Widget>[
          //         Icon(Icons.check_circle_outline,size: 24,color: Colors.indigo,),
          //         SizedBox(width: 10,),
          //         Expanded(child: Text("Bakery, Cakes & Diary",style: TextStyle(
          //             color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w500
          //         ),))
          //       ],
          //     ),
          //   ),
          //   Divider(),

          //   Container(
          //     padding: EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
          //     alignment: Alignment.centerLeft,
          //     child: Row(
          //       children: <Widget>[
          //         Icon(Icons.check_circle_outline,size: 24,color: Colors.indigo,),
          //         SizedBox(width: 10,),
          //         Expanded(child: Text("Snacks & Branded Foods",style: TextStyle(
          //             color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w500
          //         ),))
          //       ],
          //     ),
          //   ),
          //   Divider(),

          //   Container(
          //     padding: EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
          //     alignment: Alignment.centerLeft,
          //     child: Row(
          //       children: <Widget>[
          //         Icon(Icons.check_circle_outline,size: 24,color: Colors.indigo,),
          //         SizedBox(width: 10,),
          //         Expanded(child: Text("Kitchen",style: TextStyle(
          //             color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w500
          //         ),))
          //       ],
          //     ),
          //   ),
          //   Divider(),

          //   Container(
          //     padding: EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
          //     alignment: Alignment.centerLeft,
          //     child: Row(
          //       children: <Widget>[
          //         Icon(Icons.check_circle_outline,size: 24,color: Colors.indigo,),
          //         SizedBox(width: 10,),
          //         Expanded(child: Text("Cleaning & Household",style: TextStyle(
          //             color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w500
          //         ),))
          //       ],
          //     ),
          //   ),
          //   Divider(),

          //   Container(
          //     padding: EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
          //     alignment: Alignment.centerLeft,
          //     child: Row(
          //       children: <Widget>[
          //         Icon(Icons.check_circle_outline,size: 24,color: Colors.indigo,),
          //         SizedBox(width: 10,),
          //         Expanded(child: Text("Beauty & Hygiene",style: TextStyle(
          //             color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w500
          //         ),))
          //       ],
          //     ),
          //   ),
          //   Divider(),

          //   Container(
          //     padding: EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
          //     alignment: Alignment.centerLeft,
          //     child: Row(
          //       children: <Widget>[
          //         Icon(Icons.check_circle_outline,size: 24,color: Colors.indigo,),
          //         SizedBox(width: 10,),
          //         Expanded(child: Text("Baby Care",style: TextStyle(
          //             color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w500
          //         ),))
          //       ],
          //     ),
          //   ),
          //   Divider(),

          //   Container(
          //     padding: EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
          //     alignment: Alignment.centerLeft,
          //     child: Row(
          //       children: <Widget>[
          //         Icon(Icons.check_circle_outline,size: 24,color: Colors.indigo,),
          //         SizedBox(width: 10,),
          //         Expanded(child: Text("Gourmet & World Food",style: TextStyle(
          //             color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w500
          //         ),))
          //       ],
          //     ),
          //   ),
          //   Divider(),

          //   Container(
          //     padding: EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
          //     alignment: Alignment.centerLeft,
          //     child: Row(
          //       children: <Widget>[
          //         Icon(Icons.check_circle_outline,size: 24,color: Colors.indigo,),
          //         SizedBox(width: 10,),
          //         Expanded(child: Text("Medicines",style: TextStyle(
          //             color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w500
          //         ),))
          //       ],
          //     ),
          //   ),
          //   Divider(),

          //   Container(
          //     padding: EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
          //     alignment: Alignment.centerLeft,
          //     child: Row(
          //       children: <Widget>[
          //         Icon(Icons.check_circle_outline,size: 24,color: Colors.indigo,),
          //         SizedBox(width: 10,),
          //         Expanded(child: Text("Pets & Gardens",style: TextStyle(
          //             color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w500
          //         ),))
          //       ],
          //     ),
          //   ),
          //   Divider(),

            




          // ],
        )
      ]
      );
  }
}