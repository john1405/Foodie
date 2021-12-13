import 'package:flutter/cupertino.dart';
import 'package:foodie/main.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart' as geoCo;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String finalAddress = 'Searching address..';

class GenerateMaps extends ChangeNotifier {
  late Position position;
  Position get getPosition => position;
  late GoogleMapController googleMapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  String countryName = "nothing", mainAddress = "nothing";
  String get getGetcountryName => countryName;
  String get getGetmainAddress => countryName;

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

  getMarkers(double lat, double alt) {
    MarkerId markerId = MarkerId(lat.toString() + alt.toString());
    Marker marker = Marker(
      markerId: markerId,
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(lat, alt),
      infoWindow:
          InfoWindow(title: getGetmainAddress, snippet: getGetcountryName),
    );
    markers[markerId] = marker;
  }

  Widget fetchMaps() {
    return GoogleMap(
        mapType: MapType.hybrid,
        myLocationEnabled: true,
        mapToolbarEnabled: true,
        onTap: (loc) async {
          final cords = geoCo.Coordinates(loc.latitude, loc.longitude);
          var address =
              await geoCo.Geocoder.local.findAddressesFromCoordinates(cords);

          countryName = address.first.countryName;
          mainAddress = address.first.addressLine;
          notifyListeners();

          getMarkers(loc.latitude, loc.longitude);

          print(loc);
          print(countryName);
          print(mainAddress);
        },
        markers: Set<Marker>.of(markers.values),
        onMapCreated: (GoogleMapController mapController) {
          googleMapController = mapController;
          notifyListeners();
        },
        initialCameraPosition:
            CameraPosition(target: LatLng(21.000, 45.000), zoom: 18.0));
  }
}
