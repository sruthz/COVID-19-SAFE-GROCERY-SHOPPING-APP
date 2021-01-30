import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:grocery/screens/home/confirmation.dart';

class Credt_Card extends StatefulWidget {
  Map<String,int> cart_list;
  String name;
  DateTime dt;
  Credt_Card({this.cart_list,this.name,this.dt});
  @override
  _Credt_CardState createState() => _Credt_CardState();
}


class _Credt_CardState extends State<Credt_Card> {
  
   String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: CreditCardForm(
                    onCreditCardModelChange: onCreditCardModelChange,
                  ),
                ),
              ),
              RaisedButton(
    onPressed: () {
      
                      Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Confirmation_page(cart_list : widget.cart_list,name:widget.name,dt:widget.dt,status : 'Payment Successful'))
                      );
                      
    },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
    padding: EdgeInsets.all(0.0),
    child: Ink(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xff374ABE), Color(0xff64B6FF)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(30.0)
      ),
      child: Container(
        constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
        alignment: Alignment.center,
        child: Text(
          "Pay",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    ),
  ),
            ],
          ),
        ),
      );
  }
  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
