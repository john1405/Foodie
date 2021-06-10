import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/Views/HomePage.dart';
import 'package:page_transition/page_transition.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatinActionButton(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appbBar(context),
            headerText(),
            cartData(),
            shippinDetails(context),
            billingData()
          ],
        ),
      ),
    );
  }

  Widget appbBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Row(children: [
        IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black26),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: Homescreen(),
                      type: PageTransitionType.rightToLeftWithFade));
            }),
        Padding(
          padding: const EdgeInsets.only(left: 300.0),
          child: IconButton(
              icon: Icon(FontAwesomeIcons.trash, color: Colors.amberAccent),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: Homescreen(),
                        type: PageTransitionType.rightToLeftWithFade));
              }),
        )
      ]),
    );
  }

  Widget headerText() {
    return Column(
      children: [
        Text(
          'Your',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        Text(
          'Cart',
          style: TextStyle(
              color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget cartData() {
    return SizedBox(
      height: 240.0,
    );
  }

  Widget shippinDetails(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.grey.shade500, blurRadius: 5, spreadRadius: 3),
      ], borderRadius: BorderRadius.circular(40.0), color: Colors.white),
      height: 120.0,
      width: 400.0,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(FontAwesomeIcons.locationArrow),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                          constraints: BoxConstraints(maxWidth: 250.0),
                          child: Text('<mock address from headers>')),
                    )
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(EvaIcons.clock),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                          constraints: BoxConstraints(maxWidth: 250.0),
                          child: Text('<mock timing: 6pm-8pm>')),
                    )
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget billingData() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.shade500, blurRadius: 5, spreadRadius: 3),
        ], borderRadius: BorderRadius.circular(40.0), color: Colors.white),
        height: 110.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Subtotal',
                  style: TextStyle(color: Colors.grey, fontSize: 16.0),
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.rupeeSign,
                      color: Colors.grey,
                      size: 16.0,
                    ),
                    Text(
                      '300.00',
                      style: TextStyle(color: Colors.grey, fontSize: 16.0),
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Delivery Charges',
                  style: TextStyle(color: Colors.grey, fontSize: 16.0),
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.rupeeSign,
                      color: Colors.grey,
                      size: 16.0,
                    ),
                    Text(
                      '20.00',
                      style: TextStyle(color: Colors.grey, fontSize: 16.0),
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(color: Colors.black, fontSize: 21.0),
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.rupeeSign,
                        color: Colors.grey,
                        size: 16.0,
                      ),
                      Text(
                        '320.00',
                        style: TextStyle(color: Colors.black, fontSize: 21.0),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget floatinActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 250.0,
            height: 50.0,
            decoration: BoxDecoration(
                color: Colors.red.shade500,
                borderRadius: BorderRadius.circular(50.0)),
            child: Center(
              child: Text(
                'Place Order',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
