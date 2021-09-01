import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class DatabaseController {
  //firestore instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //collection
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  var logger = Logger();

  Future<void> saveUserData(
    String userName,
    email,
    password,
    country,
    uid,
  ) {
    // Call the user's CollectionReference to add a new user
    // return users
    //     .add({
    //       'userName': userName,
    //       'email': email,
    //       'password': password,
    //       'country': country,
    //     })
    //     .then((value) => print("User Added"))
    //     .catchError((error) => print("Failed to add user: $error"));
    return users
        .doc(uid)
        .set({
          'user ID': uid,
          'userName': userName,
          'email': email,
          'password': password,
          'country': country,
        })
        .then((value) => print("User Added"))
        .catchError((error) => logger.i("Failed to add user: $error"));
  }
}
