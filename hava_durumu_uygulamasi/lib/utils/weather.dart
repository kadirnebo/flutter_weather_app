import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hava_durumu_uygulamasi/utils/location.dart';
import 'package:http/http.dart' as http;

const apiKey = "4af8216bf3849e04e22aa632473e37c2";

class WeatherDisplayData {
  Icon? weatherIcon;
  AssetImage weatherImage;

  WeatherDisplayData(@required this.weatherIcon, this.weatherImage);
}

class WeatherData {
  WeatherData({
    @required this.locationData,
    this.currentTemperature,
    this.currentCondition,
    this.city,
  });
  LocationHelper? locationData;

  double? currentTemperature;
  int? currentCondition;
  String? city;

  Future<void> getCurrentTemperature() async {
    var url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=${locationData?.latitude}&lon=${locationData?.longitude}&appid=$apiKey&units=metric");

    var response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var currentWeather = jsonDecode(data);

      try {
        currentTemperature = currentWeather['main']['temp'];
        currentCondition = currentWeather['weather'][0]['id'];
        city = currentWeather['name'];
      } catch (e) {
        print(e);
      }
    } else {
      print("API'den değer gelmiyor.");
    }
  }

  WeatherDisplayData? getWeatherDisplayData() {
    if (currentCondition as int < 600) {
      return WeatherDisplayData(
        const Icon(
          FontAwesomeIcons.cloud,
          size: 75.0,
          color: Colors.white,
        ),
        const AssetImage("assets/bulutlu.png"),
      );
    } else {
      var now = DateTime.now();
      if (now.hour >= 19) {
        return WeatherDisplayData(
          const Icon(
            FontAwesomeIcons.moon,
            size: 75.0,
            color: Colors.white,
          ),
          const AssetImage("assets/gece.png"),
        );
      } else {
        return WeatherDisplayData(
          const Icon(
            FontAwesomeIcons.sun,
            size: 75.0,
            color: Colors.white,
          ),
          const AssetImage("assets/gunesli.png"),
        );
      }
    }
  }
}
