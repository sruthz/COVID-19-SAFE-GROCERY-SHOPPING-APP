import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery/models/brew.dart';
import 'package:grocery/models/orders.dart';
import 'package:grocery/models/user.dart';
import 'package:grocery/models/stores.dart';

class DatabaseService {

  final String uid;

  DatabaseService({this.uid});


  //collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('brews');
  final CollectionReference storeCollection = Firestore.instance.collection('stores');
  final CollectionReference orderCollection = Firestore.instance.collection('orders');
  

  Future updateUserData(String email,String firstname,String lastname,String phonenumber,List<dynamic>previous_order) async{
    return await brewCollection.document(uid).setData({
      'email' : email,
      'firstname' : firstname,
      'lastname' : lastname,
      'phonenumber' : phonenumber,
      'previous_order'  : previous_order,
    });
  }


  //update Store
  Future updateStoreData(String uid,String id) async{
    List<dynamic> listid = new List<dynamic>();
    print(id);
    listid.add(id);
    storeCollection.document(uid).updateData({
      'orders' : FieldValue.arrayUnion(listid),
    });
    print(id);
  }

  //update user order
  Future updateUserOrderData(String uidd,String id) async{
    List<dynamic> listid = new List<dynamic>();
    listid.add(id);
    brewCollection.document(uidd).updateData({
    
      'previous_order' : FieldValue.arrayUnion(listid),
    });

  }
    //insert order data
    Future updateOrderData(String user_uid,String store_uid,List<dynamic> order_details) async{
    DocumentReference ref = orderCollection.document();
    String id =  ref.documentID;
    orderCollection.document(id).setData({
      'user_name' : order_details[0],
      'shop_name' : order_details[1],
      'cart_items' : order_details[2],
      'cart_prices_list' : order_details[3],
    });
    print(id);
    updateUserOrderData(user_uid,id);
    updateStoreData(store_uid, id);
    }
    // return await storeCollection.document(uid).setData({
    //   'area' : area,
    //   'name' : name,
    // });
  
  //brewlist from snapshots
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot)
  {
    return snapshot.documents.map((doc){
      return Brew(
        email: doc.data['email'] ?? '',
        firstname: doc.data['firstname'] ?? '',
        lastname: doc.data['lastname'] ?? '',
        phonenumber: doc.data['phonenumber'] ?? '',
      );
    }).toList();
  }

  //storedata from snapshots
  List<Stores> _storeListFromSnapshot(QuerySnapshot snapshot)
  {
    return snapshot.documents.map((doc){
      return Stores(
        name: doc.data['name'] ?? '',
        area: doc.data['area'] ?? '',
        id: doc.data['id'] ?? '',
        slot: doc.data['slot'] ?? '',
        cat: doc.data['cat'] ?? '[]',
        itemslist :  doc.data['itemslist'] ?? '[]',
      );
    }).toList();
  }

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name : snapshot.data['name'],
      sugars : snapshot.data['sugars'],
      strength : snapshot.data['strength'],
    );
  }

  //order data
  Orders _orderDataFromSnapshot(DocumentSnapshot snapshot){
    print(snapshot.data['cart_items'].runtimeType);
    return Orders(
      customer_name: snapshot.data['user_name'],
      shop_name : snapshot.data['shop_name'],
      cart_items : snapshot.data['cart_items'],
      cart_prices_items : snapshot.data['cart_prices_list'],
    );
  }

  //
  BrewData _userdataFromSnapshot(DocumentSnapshot snapshot){
    return BrewData(
      uid : uid,
      email: snapshot.data['email'],
      firstname: snapshot.data['firstname'],
      lastname: snapshot.data['lastname'],
      phonenumber: snapshot.data['phonenumber'],
      previous_order: snapshot.data['previous_order'],
      password: snapshot.data['password'],
    );
  }
  //get brews Stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots()
    .map(_brewListFromSnapshot);
  }

  //get stores Stream
  Stream<List<Stores>> get stores {
    return storeCollection.snapshots()
    .map(_storeListFromSnapshot);
  }

  //get user dox stream
  Stream<UserData> get userData {
    return brewCollection.document(uid).snapshots()
    .map(_userDataFromSnapshot);
  }

  //get orders
   Stream<Orders> get orderData {
         print('Uid: '+uid);
         print(orderCollection.document(uid).snapshots().map(_orderDataFromSnapshot));
    return orderCollection.document(uid).snapshots()
    .map(_orderDataFromSnapshot);
  }


  //get user data
  Stream<BrewData> get userdata {
    return brewCollection.document(uid).snapshots()
    .map(_userdataFromSnapshot);
  }
}