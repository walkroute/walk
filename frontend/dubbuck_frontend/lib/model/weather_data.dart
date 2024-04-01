import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherData {
  final String condition;
  final double temperature;
  final double feelsLike;
  final double windSpeed;
  final int humidity;
  final String iconCode;

  WeatherData({
    required this.condition,
    required this.temperature,
    required this.feelsLike,
    required this.windSpeed,
    required this.humidity,
    required this.iconCode,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {

    return WeatherData(
      condition: json['weather'][0]['main'],
      temperature: (json['main']['temp'] as num).toDouble(),
      feelsLike: (json['main']['feels_like'] as num).toDouble(),
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      humidity: json['main']['humidity'] as int,
      iconCode: json['weather'][0]['icon'],
    );
  }


  String getIconUrl() {
    return 'https://openweathermap.org/img/wn/$iconCode@2x.png';
  }
}
