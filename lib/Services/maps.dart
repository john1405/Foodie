import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart' as geoCo;
import 'package:flutter/material.dart';

String finalAddress = 'Searching address..';

class GenerateMaps extends ChangeNotifier {
  // Position position;

  Future getCurrentLocation() async {
    var postionedData = await GeolocatorPlatform.instance.getCurrentPosition();
    final cords =
        geoCo.Coordinates(postionedData.latitude, postionedData.longitude);
    var address =
        await geoCo.Geocoder.local.findAddressesFromCoordinates(cords);
    String mainAddress = address.first.addressLine;
    print(mainAddress);
    finalAddress = mainAddress;
    notifyListeners();
  }
}
