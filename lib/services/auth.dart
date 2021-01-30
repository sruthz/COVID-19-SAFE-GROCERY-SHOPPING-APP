import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery/models/user.dart';
import 'package:grocery/services/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;


  //create User object based on firebase services
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;

  }

  //auth change user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged
    .map(_userFromFirebaseUser);
  }
  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email,String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email,String password,String firstname,String lastname,String phonenumber) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      //create a new document for user with uid
      await DatabaseService(uid : user.uid).updateUserData(email,firstname,lastname, phonenumber,[]);
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //register store
  Future registerStoreWithNameAndArea(String name,String area) async{
    try{

      await DatabaseService(uid : '1').updateStoreData(name,area);
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  // sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }


}