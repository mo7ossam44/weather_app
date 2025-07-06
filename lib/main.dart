import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubtis/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: getThemeColor(
              BlocProvider.of<GetWeatherCubit>(
                context,
              ).weatherModel?.weatherStatus,
            ),
          ),
          home: HomeScreen(),
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'sunny':
    case 'clear':
      return Colors.amber;

    case 'partly cloudy':
      return Colors.yellow;

    case 'cloudy':
    case 'overcast':
      return Colors.blueGrey;

    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.grey;

    case 'patchy rain possible':
    case 'patchy light drizzle':
    case 'light drizzle':
    case 'patchy light rain':
    case 'light rain':
    case 'light rain shower':
    case 'patchy light rain with thunder':
      return Colors.blue;

    case 'moderate rain':
    case 'moderate rain at times':
    case 'moderate or heavy rain shower':
    case 'heavy rain':
    case 'torrential rain shower':
    case 'moderate or heavy rain with thunder':
      return Colors.indigo;

    case 'patchy snow possible':
    case 'patchy light snow':
    case 'light snow':
    case 'light snow showers':
      return Colors.lightBlue;

    case 'moderate snow':
    case 'heavy snow':
    case 'blizzard':
    case 'moderate or heavy snow showers':
    case 'moderate or heavy snow with thunder':
      return Colors.blueGrey;

    case 'thundery outbreaks possible':
    case 'patchy light snow with thunder':
      return Colors.deepPurple;

    case 'ice pellets':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.cyan;

    case 'sleet':
    case 'light sleet':
    case 'moderate or heavy sleet':
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
      return Colors.teal;

    case 'freezing drizzle':
    case 'heavy freezing drizzle':
    case 'freezing rain':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
      return Colors.blueGrey;

    default:
      return Colors.blueGrey; // fallback for unknown conditions
  }
}
