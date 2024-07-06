// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationSearch {
  static Future<List<Place>> searchPlaces(String input) async {
    final apiKey = 'AIzaSyDTUk18LXxS09snzH7U4ss9F4y3Yzn1Y3A';
    final apiUrl = 'https://maps.googleapis.com/maps/api/place/textsearch/json';

    final response = await http.get(Uri.parse('$apiUrl?query=$input&key=$apiKey'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final predictions = data['results'] as List<dynamic>;

      return predictions.map((prediction) => Place.fromJson(prediction)).toList();
    } else {
      throw Exception('Failed to load search results');
    }
  }

  static Future<String> getAddress(double lat, double lng) async {
    final apiKey = 'YOUR_GOOGLE_GEOCODING_API_KEY';
    final apiUrl = 'https://maps.googleapis.com/maps/api/geocode/json';

    final response = await http.get(Uri.parse('$apiUrl?latlng=$lat,$lng&key=$apiKey'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'] as List<dynamic>;
      if (results.isNotEmpty) {
        final addressComponents = results[0]['formatted_address'] as String;
        return addressComponents;
      }
    }

    return '';
  }
}

class Place {
  final String name;
  final double lat;
  final double lng;

  Place({
    required this.name,
    required this.lat,
    required this.lng,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    final name = json['name'] as String;
    final geometry = json['geometry'] as Map<String, dynamic>;
    final location = geometry['location'] as Map<String, dynamic>;
    final lat = location['lat'] as double;
    final lng = location['lng'] as double;

    return Place(name: name, lat: lat, lng: lng);
  }
}
