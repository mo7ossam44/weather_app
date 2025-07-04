import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/screens/search_screen.dart';
import 'package:weather/widgets/no_weather_data.dart';
import 'package:weather/widgets/weather_data.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, this.weatherModel});

  WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 10,
        title: Text(
          'Weather App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => SearchScreen()));
            },
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
        ],
      ),
      body: weatherModel == null
          ? const NoWeatherData()
          : WeatherData(weatherModel: weatherModel!),
    );
  }
}
