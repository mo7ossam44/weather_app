import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubtis/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/main.dart';
import 'package:weather/models/weather_model.dart';

class WeatherData extends StatelessWidget {
  const WeatherData({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(
      context,
    ).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            getThemeColor(weatherModel.weatherStatus)[500]!,
            getThemeColor(weatherModel.weatherStatus)[300]!,
            getThemeColor(weatherModel.weatherStatus)[50]!,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            weatherModel.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Text(
            'updated at ${weatherModel.lastUpdated.hour}:${weatherModel.lastUpdated.minute}',
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //? image
              Image.network('https:${weatherModel.icon!}'),
              //? temprature
              Text(
                '${weatherModel.tempC}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              //? column{maxtemp,mintemp}
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('maxtemp: ${weatherModel.maxtempC.round()}'),
                  Text('mintemp: ${weatherModel.mintempC.round()}'),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          Text(
            weatherModel.weatherStatus,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ],
      ),
    );
  }
}
