import 'package:flutter/material.dart';

class WeatherLocation {
  final String city;
  final String dateTime;
  final String temparature;
  final String weatherType;
  final String iconUrl;
  final int wind;
  final int rain;
  final int humidity;

  WeatherLocation({
    required this.city,
    required this.dateTime,
    required this.temparature,
    required this.weatherType,
    required this.iconUrl,
    required this.wind,
    required this.rain,
    required this.humidity,
  });
}

final locationList = [
  WeatherLocation(
    city: 'Kathmandu',
    dateTime: '07:50 PM — Monday, 26 Dec 2022',
    temparature: '24\u2103',
    weatherType: 'Night',
    iconUrl: 'assets/images/regepage.jpg',
    wind: 10,
    rain: 2,
    humidity: 10,
  ),
];