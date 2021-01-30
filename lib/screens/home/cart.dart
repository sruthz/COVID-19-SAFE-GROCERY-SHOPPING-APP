import 'package:flutter/material.dart';
import 'package:grocery/screens/home/confirmation.dart';
import 'package:grocery/screens/home/payment.dart';

class Cart extends StatefulWidget {
  @override
  Map<String,int> cart_list;
  Map<String,int> cart_prices_list ;
  String name;
  String store_id;
  DateTime dt;
  Cart({this.cart_list,this.name,this.store_id,this.cart_prices_list,this.dt});
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    List<String> list_print = List();
    list_print = widget.cart_list.entries.map((entry) => "${entry.key}").toList(); 
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Cart'),
        actions:<Widget> [
          IconButton(
              icon: Icon(Icons.confirmation_number),
              onPressed: () {
                Navigator.push(
                context,
                //MaterialPageRoute(builder: (context) => Payment(lt:lt)),
                MaterialPageRoute(builder: (context) => Payment(cart_list : widget.cart_list,cart_prices_list:widget.cart_prices_list,name:widget.name,store_id:widget.store_id,
                dt:widget.dt)),
              );
              },
            ),
        ],
      ),
      body:ListView.builder(
                  itemBuilder: (context, index) {
                    return new Card(
                                child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 100,
                          child: new Text(list_print[index],
                          textScaleFactor: 1.5,),
                        ),
                        new Container(
                          child: Ink(
                            decoration: ShapeDecoration(shape: CircleBorder(),color:Colors.lightGreen),
                            child: new IconButton(
                              highlightColor: Colors.green,
                              icon: new Icon(Icons.remove,  color: Colors.white,),
                              
                              onPressed: (){
                                setState(() {
                                  String l = list_print[index];
                                  //cart_list[l]=0;
                                  print(widget.cart_list);
                                  if(widget.cart_list.containsKey(l))
                                  {
                                    if(widget.cart_list[l]>0)
                                    widget.cart_list[l]--;
                                  }
                                  else
                                  {
                                    widget.cart_list[l] = 0;
                                  }
                                  print(widget.cart_list);
                                  });
                              },
                            ),
                          ),
                        ),
                        new Container(
                          child: new Text(widget.cart_list[list_print[index]].toString()=='null' ? '0' : widget.cart_list[list_print[index]].toString(),
                          style: Theme.of(context).textTheme.display1,),
                        ),
                        
                        new Container( 
                          child: Ink(
                            decoration: ShapeDecoration(shape: CircleBorder(),color:Colors.green[900]),
                            child: new IconButton(
                              
                              icon: new Icon(Icons.add, color: Colors.white,),
                              highlightColor: Colors.green,
                              onPressed: (){
                                setState(() {
                                  String l = list_print[index];
                                  //cart_list[l]=0;
                                  print(widget.cart_list);
                                  if(widget.cart_list.containsKey(l))
                                  {
                                    widget.cart_list[l]++;
                                  }
                                  else
                                  {
                                    widget.cart_list[l] = 1;
                                  }
                                  print(widget.cart_list);
                                  });
                              },
                            ),
                          ),
                        ),
                        new Container(
                          child: new Text('Rs. '+(widget.cart_list[list_print[index]] * widget.cart_prices_list[list_print[index]]).toString(),
                          style: Theme.of(context).textTheme.display1,),
                        ),
                      ]
                    ),
                    );
                   
                  },
                  itemCount:list_print.length,
                  shrinkWrap: true, // todo comment this out and check the result
                  physics: ClampingScrollPhysics(), // todo comment this out and check the result
                ),
     
    );
  }
}