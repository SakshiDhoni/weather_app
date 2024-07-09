import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {

  late double Longitude;
  late double Latitude;

  Future<void> getcurrentLocation() async {
    //
    //   try{
    //     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    //
    //     Latitude = position.latitude;
    //     Longitude = position.longitude;
    //   }
    //   catch(e){
    //     print(e);
    //   }
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print('Location denied');
      await Geolocator.requestPermission();
    } else {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      Latitude = position.latitude;
      Longitude = position.longitude;
    }
  }
}


