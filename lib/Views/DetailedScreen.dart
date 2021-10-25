import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/Providers/Calculations.dart';
import 'package:foodie/Views/HomePage.dart';
import 'package:foodie/Views/Mycart.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

// class DetailedScreen extends StatefulWidget {
//   final QueryDocumentSnapshot queryDocumentSnapshot;
//   DetailedScreen({required this.queryDocumentSnapshot});
//   @override
//   _DetailedScreenState createState() => _DetailedScreenState();
// }

// class _DetailedScreenState extends State<DetailedScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.queryDocumentSnapshot['name']),
//       ),
//     );
//   }
// }

class DetailedScreen extends StatefulWidget {
  final QueryDocumentSnapshot queryDocumentSnapshot;
  DetailedScreen({required this.queryDocumentSnapshot});
  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  int cheesevalue = 0;
  int baconvalue = 0;
  int onionvalue = 0;
  int totalitems = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatinActionButton(),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appbBar(context),
          pizzaimage(),
          middledata(),
          footerdetails()
        ],
      ),
    );
  }

  Widget appbBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35.0),
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
                Provider.of<Calculations>(context, listen: false)
                    .removeAllData();
              }),
        )
      ]),
    );
  }

  Widget pizzaimage() {
    return Center(
      child: SizedBox(
        height: 220.0,
        child: Container(
          child: Image.network(widget.queryDocumentSnapshot['image']),
          decoration: BoxDecoration(shape: BoxShape.circle),
        ),
      ),
    );
  }

  Widget middledata() {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.star, color: Colors.yellow.shade700, size: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                // "hi",
                widget.queryDocumentSnapshot['rating'],
                style: TextStyle(fontSize: 20.0, color: Colors.grey.shade500),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 300.0),
              child: Text(
                widget.queryDocumentSnapshot['name'],
                style: TextStyle(
                    fontSize: 32.0,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Row(
              children: [
                Icon(FontAwesomeIcons.rupeeSign,
                    size: 20.0, color: Colors.cyan),
                Text(
                  widget.queryDocumentSnapshot['price'].toString(),
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.cyan,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        )
      ],
    );
  }

  Widget footerdetails() {
    return SizedBox(
      height: 250.0,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: 5,
                        spreadRadius: 3)
                  ]),
              width: 400.0,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 40.0, right: 20.0, left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add more stuff',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'cheese',
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 20.0),
                        ),
                        Row(
                          children: [
                            IconButton(
                                icon: Icon(EvaIcons.minus),
                                onPressed: () {
                                  Provider.of<Calculations>(context,
                                          listen: false)
                                      .minuscheese();
                                }),
                            Text(
                              Provider.of<Calculations>(context, listen: true)
                                  .getCheesevalue
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.grey.shade500),
                            ),
                            IconButton(
                              icon: Icon(EvaIcons.plus),
                              onPressed: () {
                                Provider.of<Calculations>(context,
                                        listen: false)
                                    .addCheese();
                              },
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'bacon',
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 20.0),
                        ),
                        Row(
                          children: [
                            IconButton(
                                icon: Icon(EvaIcons.minus),
                                onPressed: () {
                                  Provider.of<Calculations>(context,
                                          listen: false)
                                      .minusbacon();
                                }),
                            Text(
                              Provider.of<Calculations>(context, listen: true)
                                  .getBaconvalue
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.grey.shade500),
                            ),
                            IconButton(
                                icon: Icon(EvaIcons.plus),
                                onPressed: () {
                                  Provider.of<Calculations>(context,
                                          listen: false)
                                      .addBacon();
                                }),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'onion',
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 20.0),
                        ),
                        Row(
                          children: [
                            IconButton(
                                icon: Icon(EvaIcons.minus),
                                onPressed: () {
                                  Provider.of<Calculations>(context,
                                          listen: false)
                                      .minusOnion();
                                }),
                            Text(
                              Provider.of<Calculations>(context, listen: true)
                                  .getOnionvalue
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.grey.shade500),
                            ),
                            IconButton(
                                icon: Icon(EvaIcons.plus),
                                onPressed: () {
                                  Provider.of<Calculations>(context,
                                          listen: false)
                                      .addOnion();
                                }),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Provider.of<Calculations>(context, listen: false)
                      .selectSmallSize();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Provider.of<Calculations>(context, listen: true)
                            .smallTapped
                        ? Colors.red
                        : Colors.white,
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('S', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<Calculations>(context, listen: false)
                      .selectMediumSize();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Provider.of<Calculations>(context, listen: true)
                            .mediumTapped
                        ? Colors.red
                        : Colors.white,
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('M', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<Calculations>(context, listen: false)
                      .selectLargeSize();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Provider.of<Calculations>(context, listen: true)
                            .largeTapped
                        ? Colors.red
                        : Colors.white,
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('L',
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget floatinActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Provider.of<Calculations>(context, listen: false)
                .addToCart(context, {
              'image': widget.queryDocumentSnapshot['image'],
              'name': widget.queryDocumentSnapshot['name'],
              'price': widget.queryDocumentSnapshot['price'],
              'onion': Provider.of<Calculations>(context, listen: false)
                  .getOnionvalue,
              'cheese': Provider.of<Calculations>(context, listen: false)
                  .getCheesevalue,
              'bacon': Provider.of<Calculations>(context, listen: false)
                  .getBaconvalue,
              'size': Provider.of<Calculations>(context, listen: false).getSize,
            });
          },
          child: Container(
            width: 250.0,
            height: 50.0,
            decoration: BoxDecoration(
                color: Colors.red.shade500,
                borderRadius: BorderRadius.circular(50.0)),
            child: Center(
              child: Text(
                'Add to cart',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        Stack(children: [
          FloatingActionButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: MyCart(), type: PageTransitionType.bottomToTop));
              },
              child: Icon(Icons.shopping_basket_rounded, color: Colors.black)),
          Positioned(
              left: 35,
              child: CircleAvatar(
                radius: 10,
                child: Text('$totalitems'),
              ))
        ]),
      ],
    );
  }
}
