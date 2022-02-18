
import 'package:flutter/material.dart';
import 'package:tourguide/Screen/location_screen.dart';
import 'package:tourguide/Screen/weathermodel.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

      Navigator.push(context, MaterialPageRoute(builder: (
        context) {
        return LocationScreen(
          locationweather: weatherData, );
      }
      ) );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}