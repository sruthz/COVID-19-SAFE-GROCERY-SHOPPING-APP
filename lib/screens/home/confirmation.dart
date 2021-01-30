import 'package:flutter/material.dart';
import 'package:grocery/models/brew.dart';
import 'package:grocery/models/user.dart';
import 'package:grocery/screens/home/home.dart';
import 'package:grocery/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:grocery/services/database.dart';

class Confirmation_page extends StatefulWidget {
  Map<String,int> cart_list;
  Map<String,int> cart_prices_list;
  String name;
  String store_id;
  DateTime dt;
  String status = 'Successful';
  Confirmation_page({this.cart_list,this.cart_prices_list,this.name,this.store_id,this.dt,this.status});
  @override
  _Confirmation_pageState createState() => _Confirmation_pageState();
}

class _Confirmation_pageState extends State<Confirmation_page> {
  bool check = true;
  @override
  Future setOrder(String uidd,String user_name) async{

    dynamic result = await DatabaseService(uid: '').updateOrderData(uidd,widget.store_id,[user_name,widget.name,widget.cart_list.toString(),widget.cart_prices_list.toString()]);
  }
  
  final AuthService _auth = AuthService();
  
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
     return StreamBuilder<BrewData>(
       stream: DatabaseService(uid: user.uid).userdata,
       
       builder: (context, snapshot) {
         if(snapshot.hasData){
          BrewData userdata = snapshot.data;
          if(check)
          {
          check = false;
          setOrder(user.uid,(userdata.firstname+' '+userdata.lastname));
          
          }
         return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text('Confirmation'),
            actions: <Widget>[
              Padding(
      padding: EdgeInsets.only(right: 20.0),
      child:
                InkWell(
                  child: Icon(
                    Icons.home,
                  ),
                  onTap: ()
                  {
                     Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home())
                      );
                  },
                ),
                ),
            ],
          ),
          body:Padding(
            padding: new EdgeInsets.only(left:100.0),
            child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: <Widget>[
                Text(widget.status),
                QrImage(
                data: ('name : ' + userdata.firstname.toString()  + ' '  + userdata.lastname.toString()  + '\n mobile:'   + userdata.phonenumber.toString()  + '\n Date and Time : '  + widget.dt.toString()  + ' \n Shop Name : '  + widget.name.toString() +'\n ' + widget.cart_list.toString()),
                version: QrVersions.auto,
                size: 200.0,
              ),
                           ],
                          ),
                        ),
                  );
       }
       else
       {
         return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text('Confirmation'),
          ),
          backgroundColor: Colors.white,
          body:Center(
            child: Text('Error',style: TextStyle(color: Colors.black,),
            
          ),
         )
         );
       }
       }
     );
       
  }
}