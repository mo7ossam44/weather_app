import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubtis/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubtis/get_weather_cubit/get_weather_states.dart';
import 'package:weather/screens/search_screen.dart';
import 'package:weather/widgets/no_weather_data.dart';
import 'package:weather/widgets/weather_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          return state is InitialState
              ? NoWeatherData()
              : state is WeatherLoadeddState
              ? WeatherData()
              : Text('oops, there was an error');
        },
      ),
    );
  }
}
