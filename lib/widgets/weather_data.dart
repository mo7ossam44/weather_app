import 'package:flutter/material.dart';

class WeatherData extends StatelessWidget {
  const WeatherData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Alexandria',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        Text('updated at: 23:46'),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //? image
            Image.asset('assets/images/cloudy.png'),
            //? temprature
            Text(
              '17',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            //? column{maxtemp,mintemp}
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text('maxtemp: 17'), Text('mintemp: 10')],
            ),
          ],
        ),
        SizedBox(height: 30),
        Text(
          'Light Rain',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ],
    );
  }
}
