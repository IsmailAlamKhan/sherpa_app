import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:sherpa_app/models/user.dart';
import 'package:sherpa_app/services/database.dart';


class AuthService extends ChangeNotifier
{

 // UserData _currentUser = AuthService();
  String? _uid;
  String? _email;

  String? get getUid => _uid;
  String? get getEmail => _email;


  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create user ojb based on firebaseuser

  UserData? _userFromFireBaseUser(User? user) {
    return user != null ? UserData(uid: user.uid) : null;
  }
//FirebaseUser = User
//AuthResult == UserCredential
  //auth change user stream
  Stream<UserData> get user {
    return _auth.authStateChanges()
        .asyncMap(_userFromFireBaseUser)
        .where((user) => user != null)
        .map((user) => user!);
  }

  //Get UID
  Future getCurrentUID() async
  {
    final currentUid = await _auth.currentUser!.uid;
    return currentUid;
  }

  //Sign in(anon)
  Future signInAnon() async
  {
    try
    {
    UserCredential result =  await _auth.signInAnonymously();
    User? user = result.user;
    return _userFromFireBaseUser(user);
    }
    catch(e) {
      print(e.toString());
    }
  }


  //Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user  = result.user;


      _uid = await _auth.currentUser!.uid;
      _email = await _auth.currentUser!.email;


      return _userFromFireBaseUser(user);
    }
    catch (e){
      print(e.toString());
    }
  }


  //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    UserData _user = UserData();
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user  = result.user;
      _user.uid = result.user!.uid;
      _user.email = result.user!.email;
      //_user.fullName = result.user.fullName; Future addition FROM COMPLETE FLUTTER APP #8
      UserDatabase().createUser(_user);

      //create a new document for user with UID
      //await UserDatabase(uid: user.uid, selectedHabit: 'Running').updateUserHabit('Marathon', 'In running'); //Create a dummy
      return _userFromFireBaseUser(user);
    }
    catch (e){
      print(e.toString());
    }
  }

  //sign out
  Future<void> signOut() async {
   /* try{

    }
    catch(e){
      print(e.toString());
    }*/
    await _auth.signOut();
  }
}