import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/screens/home_screen.dart';
import 'package:weather/services/weather_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  WeatherModel? weatherModel;

  // @override
  // void initState() {
  //   super.initState();
  //   getweather();
  // }

  // Future<WeatherModel> getweather({String? onSubmittedCityName}) async =>
  //     weatherModel = await WeatherService().getWeatherData(
  //       cityName: onSubmittedCityName!,
  //     );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        elevation: 10,
        title: Text(
          'Search City',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            onSubmitted: (value) async {
              weatherModel = await WeatherService().getWeatherData(
                cityName: value,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(weatherModel: weatherModel),
                ),
              );
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              labelText: 'Serach',
              hintText: 'Enter City Name',
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
