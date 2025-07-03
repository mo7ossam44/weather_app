import 'package:flutter/material.dart';
import 'package:weather/screens/search_screen.dart';
import 'package:weather/widgets/weather_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: WeatherData(),
    );
  }
}
