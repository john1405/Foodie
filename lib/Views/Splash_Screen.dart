import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodie/Views/HomePage.dart';
import 'package:foodie/Views/Login.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

String userUid = "";

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future getUid() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userUid = sharedPreferences.getString('uid')!;
    print("The used id of this = > ");
    print(userUid);
  }

  @override
  void initState() {
    // TODO: implement initState
    getUid().whenComplete(() {
      Timer(
          Duration(seconds: 5),
          () => Navigator.pushReplacement(
              context,
              PageTransition(
                  child: userUid == null ? Login() : Homescreen(),
                  type: PageTransitionType.leftToRight)));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 400,
              child: Lottie.asset('Animation/full.json'),
            ),
            RichText(
                text: TextSpan(
                    text: 'Fo',
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: <TextSpan>[
                  TextSpan(
                    text: 'od',
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  TextSpan(
                    text: 'ie',
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ]))
          ],
        ),
      ),
    );
  }
}
