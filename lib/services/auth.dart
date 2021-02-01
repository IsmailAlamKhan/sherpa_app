import 'package:firebase_auth/firebase_auth.dart';
import 'package:sherpa_app/models/user.dart';
import 'package:node_interop/module.dart';

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

  //register with email and password

  //sign out
}