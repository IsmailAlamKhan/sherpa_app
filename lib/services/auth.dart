import 'package:firebase_auth/firebase_auth.dart';
import 'package:sherpa_app/models/user.dart';
import 'package:sherpa_app/services/database.dart';


class AuthService
{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create user ojb based on firebaseuser

  NUser _userFromFireBaseUser(User user) {
    return user != null ? NUser(uid: user.uid) : null;
  }
//FirebaseUser = User
//AuthResult == UserCredential
  //auth change user stream
  Stream<NUser> get user{
    return _auth.authStateChanges()
        .asyncMap(_userFromFireBaseUser);

  }

  //Get UID
  Future<String> getCurrentUID() async
  {
    var currentUid = await _auth.currentUser.uid;
    print(currentUid);
    return currentUid;
  }

  //Sign in(anon)
  Future signInAnon() async
  {
    try
    {
    UserCredential result =  await _auth.signInAnonymously();
    User user = result.user;
    return _userFromFireBaseUser(user);
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }
  //Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user  = result.user;
      return _userFromFireBaseUser(user);
    }
    catch (e){
      print(e.toString());
      return null;
    }
  }
  //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user  = result.user;

      //create a new document for user with UID
      await DatabaseService(uid: user.uid).updateUserData('new crew member', '0' , 100); //Create a dummy
      return _userFromFireBaseUser(user);
      print(user.uid);
    }
    catch (e){
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try{
      await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}