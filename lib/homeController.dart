import 'dart:convert';
import 'package:snapshot/snapshot.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:snapshot/snapshot.dart';


double latitude = 0,
    longitude = 0;

void geoLoc() async {
  var position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  var lat = position.latitude;
  var lon = position.longitude;
  latitude = lat;
  longitude = lon;
  print(position);
}

void getCountry() {
  //geoLoc();
  String latstr = latitude.toString();
  String longstr = latitude.toString();
  Future<Location> fetchLocation() async {
    final response = await http.get(Uri.parse(
        'https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=$latstr&lon=$longstr&zoom=3'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print("good");
      return Location.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  print(fetchLocation().toString());
  //print(Location.getCc());
}

class Location {
  final String countryCode;

  Location({required this.countryCode});
  //String getCc(){
   // return countryCode;
  //}

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(countryCode: json['address']['country_code']);
  }

}
