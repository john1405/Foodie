import 'package:flutter/material.dart';
import 'package:foodie/Services/maps.dart';
import 'package:foodie/Views/MyCart.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Maps extends StatelessWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Provider.of<GenerateMaps>(context, listen: false).fetchMaps(),
          Positioned(
            top: 700,
            left: 50,
            child: Container(
                color: Colors.white,
                height: 70,
                width: 300,
                child: Text(Provider.of<GenerateMaps>(context, listen: true)
                    .getmainAddress)),
          ),
          Positioned(
              top: 50.0,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: MyCart(), type: PageTransitionType.fade));
                },
              ))
        ],
      ),
    );
  }
}
