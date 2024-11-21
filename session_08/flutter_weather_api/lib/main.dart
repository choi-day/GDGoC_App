import 'package:flutter/material.dart';
import 'package:flutter_weather_api/view/weather_view.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';

const String apiKey = 'ee1921b84d9e83166a5d7a70517590ad';

void main() {
  runApp(const MaterialApp(
    home: WeatherApp(),
  ));
}
