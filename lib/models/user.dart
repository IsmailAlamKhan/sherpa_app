

import 'package:cloud_firestore/cloud_firestore.dart';

class UserData
{
  String? uid;
  String? email;
  String? fullName;
  Timestamp? accountCreated;


  UserData(
      {
        this.uid,
        this.email,
        this.fullName,
        this.accountCreated
      });
}