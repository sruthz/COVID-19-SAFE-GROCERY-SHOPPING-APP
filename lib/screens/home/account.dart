import 'package:flutter/material.dart';
import 'package:grocery/models/brew.dart';
import 'package:grocery/models/user.dart';
import 'package:grocery/services/database.dart';
import 'package:provider/provider.dart';

class Account extends StatelessWidget {
    TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phnoController = TextEditingController();
   TextEditingController ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
     return StreamBuilder<BrewData>(
       stream: DatabaseService(uid: user.uid).userdata,
       builder: (context, snapshot) {
         if(snapshot.hasData){
          BrewData userdata = snapshot.data;
         return Container(
           child : ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child:Text('My Account',
              textAlign: TextAlign.center,
              style:TextStyle(
                color: Colors.redAccent,
                fontWeight:FontWeight.w500,
                fontSize:20.0,
                ),),
            ),
            Container(height:150,padding:EdgeInsets.all(8),
            child:Image.asset('assets/images/basket.jpg'),
            ),
          
           Container(
            child:Text('My Account Name',style:TextStyle(fontSize:10)),padding:EdgeInsets.all(5),),
            
            Container(
            padding:EdgeInsets.all(10),
            child:TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: (userdata.firstname + userdata.lastname),
              ),
            ),),
            Container(
            child:Text('Enter Password',
            style:TextStyle(fontSize:10,
            )),
            padding:EdgeInsets.all(5),
            ),
            Container(
              padding:EdgeInsets.all(10),
              child:TextField(
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: userdata.password,
              ),
            ),),
          
            Container(
              child:Text('Enter The Email',
              style:TextStyle(fontSize:10,
              )),
              padding:EdgeInsets.all(5),
            ),
            Container(
              padding:EdgeInsets.all(10),
              child:TextField(
              controller: addressController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: userdata.email,
              ),
            )),
            Container(
            child:Text('Enter Phone Number',
            style:TextStyle(fontSize:10,
            )),
            padding:EdgeInsets.all(5),
            ),
            Container(
              padding:EdgeInsets.all(10),
              child:TextField(
               
              controller: phnoController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: userdata.phonenumber),   
            )),
            Container(
              child:RaisedButton(onPressed: (){},
              child: Text('Edit'),)
            )
            ],
          ),
    );
         }
       }
     );
  }
}