import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hava_durumu_uygulamasi/utils/weather.dart';

class MainScreen extends StatefulWidget {
  final WeatherData? weatherData;

  const MainScreen({Key? key, @required this.weatherData}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int? temperature;
  Icon? weatherDisplayIcon;
  late AssetImage backgroundImage;
  String? city;

  void updateDisplayInfo() {
    setState(() {
      temperature = widget.weatherData?.currentTemperature?.round();
      city = widget.weatherData?.city;
      var weatherDisplayData = widget.weatherData?.getWeatherDisplayData();
      backgroundImage = weatherDisplayData!.weatherImage;
      weatherDisplayIcon = weatherDisplayData.weatherIcon;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateDisplayInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 40.0,
            ),
            Container(
              child: weatherDisplayIcon,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Center(
              child: Text(
                "$temperature °C",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 80.0,
                  letterSpacing: -5,
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Center(
              child: Text(
                "$city",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  letterSpacing: -5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
