import 'package:flutter/material.dart';
import 'package:grocery/screens/home/confirmation.dart';
import 'package:grocery/screens/home/credit_card.dart';

class Payment extends StatefulWidget {
  Map<String,int> cart_list;
  Map<String,int> cart_prices_list;
  String name;
  DateTime dt;
  String store_id;
  Payment({this.cart_list,this.name,this.store_id,this.dt,this.cart_prices_list});
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Builder(
          builder: (context) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap:(){
                      
                      Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Confirmation_page(cart_list : widget.cart_list,cart_prices_list:widget.cart_prices_list,name:widget.name,store_id:widget.store_id,dt:widget.dt,status: 'Booked Successfully',))
                      );
                      
                    },
                  child :Card(
                  color: Colors.orangeAccent,
                  elevation: 15,
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Cash",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.attach_money,
                            color: Colors.black,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
                  InkWell(
                    onTap:(){
                      Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Credt_Card(cart_list : widget.cart_list,name:widget.name,dt:widget.dt))
                      );
                      
                    },
                    child: Card(
                      color: Colors.orangeAccent,
                      elevation: 15,
                      child: Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Card Payment",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.payment,
                                color: Colors.black,
                                size: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}