import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:location/location.dart' as lo;

const kGoogleApiKey = "AIzaSyAWPcZQCK7DB-B8GhQRnFwiHDSssMwAHuc";

class MapProvider extends ChangeNotifier {
  List<AutocompletePrediction> predictions = [];
  GooglePlace googlePlace = GooglePlace(kGoogleApiKey);
  lo.Location location = lo.Location();
  bool read = true;
  double op = 0.3;
  LatLng? latLng;
  String? country, street;
  BitmapDescriptor? icon;
  Future start() async {
    try {
      BitmapDescriptor.fromAssetImage(
              ImageConfiguration.empty, "assets/icons/noun-pin.png")
          .then((value) {
        icon = value;
        notifyListeners();
      });
      if (latLng == null) {
        bool serviceEnabled;
        lo.PermissionStatus permissionGranted;
        lo.LocationData locationData;
        serviceEnabled = await location.serviceEnabled();
        if (!serviceEnabled) {
          serviceEnabled = await location.requestService();
          if (!serviceEnabled) {}
        }
        permissionGranted = await location.hasPermission();
        if (permissionGranted == lo.PermissionStatus.denied) {
          permissionGranted = await location.requestPermission();
          if (permissionGranted != lo.PermissionStatus.granted) {
            locationData = await location.getLocation();
            if (locationData.longitude != null) {
              latLng = LatLng(locationData.latitude!, locationData.longitude!);
              read = false;
              op = 1;
            }
          }
        }
        if (latLng == null) {
          if (permissionGranted == lo.PermissionStatus.granted ||
              permissionGranted == lo.PermissionStatus.grantedLimited) {
            locationData = await location.getLocation();
            if (locationData.longitude != null) {
              latLng = LatLng(locationData.latitude!, locationData.longitude!);

              read = false;
              op = 1;
            }
          }
        }
      }
      if (latLng == null) {}
    } catch (e) {
      latLng = const LatLng(29.3057, 48.0308);
      read = false;
      op = 1;
    }
    if (latLng == null) {
      latLng = const LatLng(29.3057, 48.0308);
      read = false;
      op = 1;
    }

    info();
  }

  Future info() async {
    if (Platform.isIOS || Platform.isAndroid) {
      try {
        late String local;
        if (prefs.getString("lang") == 'en') {
          local = 'enUS';
        } else {
          local = 'idID';
        }

        List<Placemark> placemarks = await placemarkFromCoordinates(
            latLng!.latitude, latLng!.longitude,
            localeIdentifier: local);
        Placemark placeMark = placemarks[0];
        String? name = placeMark.name;
        String? subLocality = placeMark.subLocality;
        String? locality = placeMark.locality;
        String administrativeArea = placeMark.administrativeArea ?? '';
        String? postalCode = placeMark.postalCode;
        String country = placeMark.country ?? '';
        String? street = placeMark.street;
        String? subArea = placeMark.subAdministrativeArea;
        String? thoroughfare = placeMark.thoroughfare;
        String? address =
            "1-$name\n2-$subLocality\n3-$locality\n4-$administrativeArea\n5-$postalCode\n6-$country\n7-$street\n8-$subArea\n9-$thoroughfare";
        debugPrint(address);

        if (street != '') {
          this.street = street;
        } else {
          this.street = name;
        }
        this.country = '$country, $administrativeArea';
        notifyListeners();
      } catch (e) {}
    }
    notifyListeners();
  }

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);

    if (result != null && result.predictions != null) {
      predictions = result.predictions!;
      notifyListeners();
    }
  }

  void updateLat(LatLng result) {
    latLng = result;
    notifyListeners();
  }

  void clearPlaces() {
    predictions = [];
    notifyListeners();
  }
}
