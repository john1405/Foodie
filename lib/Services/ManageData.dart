import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodie/Providers/Authentication.dart';
import 'package:provider/provider.dart';

class ManageData extends ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future fetchData(String collection) async {
    QuerySnapshot querySnapshot =
        await firebaseFirestore.collection(collection).get();

    return querySnapshot.docs;
  }

  Future submitData(BuildContext context, dynamic data) async {
    return FirebaseFirestore.instance
        .collection('myOrders')
        .doc(Provider.of<Authentication>(context, listen: false).getUid)
        .set(data);
  }
}
