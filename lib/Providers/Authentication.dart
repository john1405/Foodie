import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication with ChangeNotifier {
  String uid = "";
  // Authentication(@required this.uid);
  String get getUid => uid;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future loginIntoAccount(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    User user = userCredential.user!;
    uid = user.uid;

    print('this is out uid => $uid');
    notifyListeners();
  }

  Future createNewAccount(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    User user = userCredential.user!;
    uid = user.uid;

    print('this is out uid => $uid');
    notifyListeners();
  }

  // final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // // final GoogleSignIn googleSignIn = GoogleSignIn();

  // late String userUid;
  // String get getUserUid => userUid;

  // Future logIntoAccount(String email, String password) async {
  //   UserCredential userCredential = await firebaseAuth
  //       .signInWithEmailAndPassword(email: email, password: password);

  //   User? user = userCredential.user;
  //   userUid = user!.uid;
  //   print(userUid);
  //   notifyListeners();
  // }

  // Future createAccount(String email, String password) async {
  //   UserCredential userCredential = await firebaseAuth
  //       .createUserWithEmailAndPassword(email: email, password: password);

  //   User? user = userCredential.user;
  //   userUid = user!.uid;
  //   print('Created account uid => $userUid');
  //   notifyListeners();
  // }
}
