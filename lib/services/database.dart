import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sherpa_app/models/user.dart';


class UserDatabase
{
  final String? uid;
  final String? selectedHabit;
  UserDatabase({this.uid, this.selectedHabit});

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createUser(UserData user) async
  {
    try{
      await _firestore.collection('userData').doc(user.uid).set({
        'fullName' : user.fullName,
        'email' : user.email,
        'accountCreated' : Timestamp.now(),
      });

    }
    catch(e){print(e);}
    return 'true'; //ADDED LATER
  }

  Future<UserData> getUserInfo(String uid) async
  {

    UserData retVal = UserData();
    try{
      DocumentSnapshot<Map<String, dynamic>> _docSnapshot = await _firestore.collection('userData').doc(uid).get();
      retVal.uid = uid;
      retVal.email = _docSnapshot.data()!["email"];
      retVal.fullName = _docSnapshot.data()!["fullName"];
      retVal.accountCreated = _docSnapshot.data()!["accountCreated"];
    } catch(e){
      print(e);
      }
    return retVal; //ADDED LATER
  }


}