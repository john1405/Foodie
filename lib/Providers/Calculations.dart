import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Services/ManageData.dart';
import 'package:provider/provider.dart';

class Calculations with ChangeNotifier {
  int cheesevalue = 0, baconvalue = 0, onionvalue = 0, cartData = 0;
  String size = "";
  // Calculations(this.size);
  String get getSize => size;

  bool isSelected = false,
      smallTapped = false,
      mediumTapped = false,
      largeTapped = false,
      selected = false;
  int get getCheesevalue => cheesevalue;
  int get getBaconvalue => baconvalue;
  int get getOnionvalue => onionvalue;
  int get getCartData => cartData;
  bool get getSelected => selected;

  addCheese() {
    cheesevalue++;
    notifyListeners();
  }

  addBacon() {
    baconvalue++;
    notifyListeners();
  }

  addOnion() {
    onionvalue++;
    notifyListeners();
  }

  minuscheese() {
    cheesevalue--;
    notifyListeners();
  }

  minusOnion() {
    onionvalue--;
    notifyListeners();
  }

  minusbacon() {
    baconvalue--;
    notifyListeners();
  }

  selectSmallSize() {
    smallTapped = true;
    size = 'S';
    notifyListeners();
  }

  selectMediumSize() {
    mediumTapped = true;
    size = 'M';
    notifyListeners();
  }

  selectLargeSize() {
    largeTapped = true;
    size = 'L';
    notifyListeners();
  }

  removeAllData() {
    cheesevalue = 0;
    onionvalue = 0;
    baconvalue = 0;
    smallTapped = false;
    mediumTapped = false;
    largeTapped = false;
    notifyListeners();
  }

  addToCart(BuildContext context, dynamic data) async {
    if (smallTapped != false || largeTapped != false || mediumTapped != false) {
      cartData++;
      await Provider.of<ManageData>(context, listen: false)
          .submitData(context, data);

      notifyListeners();
    } else {
      return showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: Colors.black45,
              height: 50.0,
              child: Center(
                child: Text(
                  'Select Size!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          });
    }
  }
}
