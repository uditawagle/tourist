import 'package:flutter/material.dart';
import 'package:tourguide/Screen/city.dart';
import 'package:tourguide/Screen/weathermodel.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationweather});

  final locationweather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  WeatherModel weather = WeatherModel();
  late int temperature;
  late String weatherIcon;
  late String cityName;
  late String weatherMessgae;

  @override
  void initState() {
    super.initState();

    updateUi(widget.locationweather);
  }

  void updateUi(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessgae = 'Unable to get weather data';
        cityName = '';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();

      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMessgae = weather.getMessage(temperature);

      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/logo/night.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async{
                      var weatherData = await weather.getLocationWeather();
                      updateUi(weatherData);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.location_on,
                        size: 40.0,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async{
                      var typeName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      if(typeName != null) {
                        var weatherData = await weather.getCityWeather(typeName);
                        updateUi(weatherData);

                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search_rounded,
                          size: 40.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 80.0
                        ),
                    ),
                    Text(
                      weatherIcon,
                      style: TextStyle(
                        fontSize: 70.0,
                        ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0, bottom: 50.0),
                child: Text(
                  '$weatherMessgae in $cityName',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontSize: 40.0,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
