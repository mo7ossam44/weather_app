import 'package:flutter/material.dart';

class NoWeatherData extends StatelessWidget {
  const NoWeatherData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'there is no weather 😊 start',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Text(
            'searching now 🔍',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ],
      ),
    );
  }
}
