class Brew{

  final String email;
  final String firstname;
  final String lastname;
  final String phonenumber;
  final List<dynamic> previous_order;

  Brew({this.email,this.firstname,this.lastname,this.phonenumber,this.previous_order});
}

class BrewData{

  final String email;
  final String firstname;
  final String lastname;
  final String phonenumber;
  final String uid;
  final String password;
  final List<dynamic> previous_order;
  BrewData({this.uid,this.email,this.firstname,this.lastname,this.phonenumber,this.previous_order,this.password});
}

