import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/MiniViews/Maps.dart';
import 'package:foodie/Providers/Authentication.dart';
import 'package:foodie/Providers/payment.dart';
import 'package:foodie/Services/ManageData.dart';
import 'package:foodie/Services/maps.dart';
import 'package:foodie/Views/HomePage.dart';
import 'package:foodie/Views/Splash_Screen.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  late Razorpay razorpay;
  int price = 200;
  int total = 220;

  @override
  void initState() {
    // TODO: implement initState
    razorpay = Razorpay();
    razorpay.on(
        Razorpay.EVENT_PAYMENT_SUCCESS,
        Provider.of<PaymentHelper>(context, listen: false)
            .handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
        Provider.of<PaymentHelper>(context, listen: false).handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
        Provider.of<PaymentHelper>(context, listen: false).handlePaymentWallet);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    razorpay.clear();
    super.dispose();
  }

  Future checkMeOut() async {
    var option = {
      'key': 'rzp_test_3INkPIOKTSGoxR',
      'amount': total,
      'name': Provider.of<Authentication>(context, listen: false).getuseremail,
      'description': 'payment',
      'prefill ': {
        'contact': '6387468322',
        'email':
            Provider.of<Authentication>(context, listen: false).getuseremail,
      },
      'external': {
        'wallet': ['paytm']
      }
    };

    try {
      razorpay.open(option);
    } catch (e) {
      print(e.toString());
    }
  }

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
            Container(
              height: 200.0,
              width: 400.0,
              decoration: BoxDecoration(
                  // image: DecorationImage(image: )
                  ),
            ),
            shippinDetails(context),
            billingData()
          ],
        ),
      ),
    );
  }

  Widget appbBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
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
                Provider.of<ManageData>(context, listen: false)
                    .deleteData(context);
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
      height: 50.0,
      // child: StreamBuilder<QuerySnapshot>(
      //   stream: FirebaseFirestore.instance.collection("myOrders").snapshots(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(child: Lottie.asset('Animation/delivery.json'));
      //     } else {
      //       return !snapshot.hasData
      //     ? Center(child: CircularProgressIndicator())
      //     : ListView.builder(
      //         itemCount: snapshot.data?.docs.length,
      //         itemBuilder: (context, index) {
      //           DocumentSnapshot data = snapshot.data[index];
      //           Map getDocs = data.data;
      //           return new Container(
      //             height: 200,
      //             width: 400,
      //             child: Image.network(getDocs.data()['image']),
      //           );

      //       });
      //     }
      //   },
      // ),
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
                          child: Text(
                              Provider.of<GenerateMaps>(context, listen: true)
                                  .getmainAddress)),
                    )
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: Maps(),
                            type: PageTransitionType.bottomToTop));
                  },
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
          onTap: () {
            Provider.of<Authentication>(context, listen: false).getUid == null
                ? print(userUid)
                : print(
                    Provider.of<Authentication>(context, listen: false).getUid);
          },
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

  placeOrder(BuildContext context, DocumentSnapshot documentSnapshot) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150.0),
                  child: Divider(
                    color: Colors.white,
                    thickness: 4.0,
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 30.0,
                          child: Text(
                            'Time',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ),
                        Container(
                          height: 30.0,
                          child: Text(
                            'Location',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.redAccent,
                      onPressed: () {
                        Provider.of<PaymentHelper>(context, listen: false)
                            .selectTime(context);
                      },
                      child: Icon(
                        (FontAwesomeIcons.clock),
                        color: Colors.white,
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.lightBlueAccent,
                      onPressed: () {
                        Provider.of<PaymentHelper>(context, listen: false)
                            .selectLocation(context);
                      },
                      child: Icon(
                        (FontAwesomeIcons.mapPin),
                        color: Colors.white,
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.lightGreenAccent,
                      onPressed: () async {
                        await checkMeOut().whenComplete(() {
                          Provider.of<PaymentHelper>(context, listen: false)
                              .showCheckoutButtonMethod();
                        });
                      },
                      child: Icon(
                        (FontAwesomeIcons.paypal),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Provider.of<PaymentHelper>(context, listen: false)
                        .selectLocation(context)
                    ? MaterialButton(
                        child: Text(
                          'place order',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection('adminCollection')
                              .add({
                            'username': Provider.of<Authentication>(context,
                                    listen: false)
                                .getuseremail,
                            'image': documentSnapshot.data()['image'],
                            'pizza': documentSnapshot.data()['name'],
                            'price': documentSnapshot.data()['price'],
                            'time': Provider.of<PaymentHelper>(context,
                                    listen: false)
                                .deliveryTiming
                                .format(context),
                            'location': Provider.of<GenerateMaps>(context,
                                    listen: false)
                                .getmainAddress,
                            'size': documentSnapshot.data()['size'],
                            'onion': documentSnapshot.data()['onion'],
                            'cheese': documentSnapshot.data()['cheese'],
                            'bacon': documentSnapshot.data()['bacon'],
                          });
                        })
                    : Container()
              ],
            ),
            height: MediaQuery.of(context).size.height * .40,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.lightBlueAccent,
            ),
          );
        });
  }
}
