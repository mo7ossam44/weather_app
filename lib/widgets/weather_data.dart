import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';

class WeatherData extends StatelessWidget {
  WeatherData({super.key, required this.weatherModel});

  WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          weatherModel.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        Text(weatherModel.lastUpdated),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //? image
            Image.asset('assets/images/cloudy.png'),
            //? temprature
            Text(
              '${weatherModel.tempC}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            //? column{maxtemp,mintemp}
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('maxtemp: ${weatherModel.maxtempC}'),
                Text('mintemp: ${weatherModel.mintempC}'),
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
    );
  }
}
