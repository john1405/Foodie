import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/Services/ManageData.dart';
import 'package:foodie/Views/DetailedScreen.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class MiddleHelpers extends ChangeNotifier {
  Widget textFav() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: RichText(
          text: TextSpan(
              text: 'Favourite  ',
              style: TextStyle(
                  shadows: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 1,
                    )
                  ],
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
            TextSpan(
              text: 'Dishes',
              style: TextStyle(
                  shadows: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 0.5,
                    )
                  ],
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w300),
            )
          ])),
    );
  }

  Widget dataFav(BuildContext context, String collection) {
    return Container(
      height: 300.0,
      child: FutureBuilder(
        future: Provider.of<ManageData>(context, listen: false)
            .fetchData(collection),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: DetailedScreen(
                                queryDocumentSnapshot: snapshot.data[index]),
                            type: PageTransitionType.leftToRightWithFade));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 300.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade500,
                                blurRadius: 5.0,
                                spreadRadius: 3)
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 180.0,
                                  child: Image.network(
                                      snapshot.data[index].data()['image']),
                                ),
                              ),
                              Positioned(
                                  left: 140.0,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        EvaIcons.heart,
                                        color: Colors.red,
                                      )))
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0, left: 4.0),
                            child: Text(
                              snapshot.data[index].data()['name'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0, left: 4.0),
                            child: Text(
                              snapshot.data[index].data()['Category'],
                              style: TextStyle(
                                  color: Colors.cyan,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow.shade700,
                                      ),
                                      Text(
                                        snapshot.data[index].data()['rating'],
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.rupeeSign,
                                          size: 12.0,
                                        ),
                                        Text(
                                          snapshot.data[index].data()['price'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }

  Widget texttoBusiness() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: RichText(
          text: TextSpan(
              text: 'Business  ',
              style: TextStyle(
                  shadows: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 1,
                    )
                  ],
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
            TextSpan(
              text: 'lunch',
              style: TextStyle(
                  shadows: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 0.5,
                    )
                  ],
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w300),
            )
          ])),
    );
  }

  Widget dataBusiness(BuildContext context, String collection) {
    return Container(
      height: 400.0,
      child: FutureBuilder(
          future: Provider.of<ManageData>(context, listen: false)
              .fetchData(collection),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade500,
                                    blurRadius: 5.0,
                                    spreadRadius: 3)
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data[index].data()['name'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 23.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      snapshot.data[index].data()['category'],
                                      style: TextStyle(
                                          color: Colors.cyan,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      snapshot.data[index]
                                          .data()['notPrice']
                                          .toString(),
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.cyan,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Row(children: [
                                      Icon(
                                        FontAwesomeIcons.rupeeSign,
                                        size: 13.0,
                                      ),
                                      Text(
                                        snapshot.data[index]
                                            .data()['price']
                                            .toString(),
                                        style: TextStyle(
                                            // decoration: TextDecoration.lineThrough,
                                            color: Colors.black,
                                            fontSize: 19.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ])
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 195.0,
                                child: Image.network(
                                    snapshot.data[index].data()['image']),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
