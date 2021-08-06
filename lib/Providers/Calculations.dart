import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculations with ChangeNotifier {
  int cheesevalue = 0, baconvalue = 0, onionvalue=0, cartData=0;
  String get getSize => size;
  String size;
  bool isSelected = false, smallTapped=false,mediumTapped=false,largeTapped=false,selected=false;
  int get getCheesevalue => cheesevalue;
  int get getBaconvalue => baconvalue;
  int get getOnionvalue => onionvalue;
  int get getCartData => cartData;
  bool get getSelected => selected;

  addCheese(){
    cheesevalue++;
    notifyListeners();
  }
  addBacon(){
    baconvalue++;
    notifyListeners();
  }
  addOnion(){
    onionvalue++;
    notifyListeners();
  }
  minuscheese(){
    cheesevalue--;
    notifyListeners();
  }
  minusOnion(){
    onionvalue--;
    notifyListeners();
  }
  minusbacon(){
    baconvalue--;
    notifyListeners();
  }
  selectSmallSize(){
    smallTapped=true;
     size='S';
     notifyListeners();
  }
  selectMediumSize(){
    mediumTapped=true;
     size='M';
     notifyListeners();
  }
  selectLargeSize(){
    largeTapped=true;
     size='L';
     notifyListeners();
  }
  removeAllData(){
    cheesevalue=0;
    onionvalue=0;
    baconvalue=0;
    smallTapped=false;
    mediumTapped=false;
    largeTapped=false;
    notifyListeners();
  }
  addToCart(BuildContext context, dynamic data) async {
    if(smallTapped=true&&largeTapped=true&&mediumTapped=true){
      cartData++;
      await Provider.of<manageData>(context,listen=false).submitData(context, data);
      notifyListeners();
    }
    else{
      return showModalBottomSheet(context: context, builder: (context)){
        return Container(
          color: Colors.black45,
          height: 50.0,
          child: Center(
            child: Text('Select Size!',style: TextStyle(
              color: Colors.white
            ),),
          ),
        );
      }

      }
    }
  }
}
