import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery/models/brew.dart';
import 'package:grocery/models/orders.dart';
import 'package:grocery/models/user.dart';
import 'package:grocery/services/database.dart';
import 'package:provider/provider.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<BrewData>(
      stream: DatabaseService(uid: user.uid).userdata,
      builder: (context, snapshot) {
        print(snapshot.data.previous_order);
        if(snapshot.hasData){
          BrewData userData = snapshot.data;
          for(int k=0;k<userData.previous_order.length;k++)
          {print(k);
            print(userData.previous_order.length);
          return ListView(
          children: <Widget>[
            for(var i in userData.previous_order)
            newProductsBlock(i),
             //have added widget multiple times to make stuff scrollable
          ],
        );

          }
      }
      else
      {
        return Container(
          child: Text('Error'),
        );
      }
      }
    );
  }
   Widget newProductsBlock(i) {

    print("---This gets called just once---");
    return Column(
      children: <Widget>[
        StreamBuilder<Orders>(
          stream: DatabaseService(uid : i).orderData,
          builder: (context, snapshot) {
             if(snapshot.hasData){
               Orders users = snapshot.data;
            return Container(
              
              width: double.maxFinite,
              child: Card(
                elevation: 10,
                color: Colors.yellow[100],
                shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
              child : Column(
                children: <Widget>[
                  //Text(users.customer_name,style: TextStyle(fontSize: 20.0),),
                  Text(users.shop_name,style: TextStyle(fontSize: 20.0),),
                  Text(users.cart_items),
                  Text(users.cart_prices_items),
                ],
              ),
              )
            );
             }
             else
      {
        return Container(
          child: Text('Error'),
        );
      }
          }
        ),
      ]
    );
   }
}