import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Views/MyCart.dart';
import 'package:page_transition/page_transition.dart';

class Footers extends ChangeNotifier {
  Widget floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      // heroTag: "this",
      onPressed: () {
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: MyCart(), type: PageTransitionType.leftToRightWithFade));
      },
      child: Icon(EvaIcons.shoppingBag),
    );
  }
}
