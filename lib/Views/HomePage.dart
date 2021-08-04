import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Helpers/Footer.dart';
import 'package:foodie/Helpers/Headers.dart';
import 'package:foodie/Helpers/Middle.dart';
import 'package:foodie/Services/maps.dart';
import 'package:foodie/Views/DetailedScreen.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    Provider.of<GenerateMaps>(context, listen: false).getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Footers().floatingActionButton(context),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Headers().appBar(context),
              Headers().headerText(),
              Headers().headerMenu(context),
              Divider(),
              MiddleHelpers().textFav(),
              MiddleHelpers().dataFav(context, 'favourite'),
              MiddleHelpers().texttoBusiness(),
              MiddleHelpers().dataBusiness(context, 'business'),
              Footers().floatingActionButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
