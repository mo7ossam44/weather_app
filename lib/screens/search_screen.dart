import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubtis/get_weather_cubit/get_weather_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        // backgroundColor: Colors.blue,
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
            onSubmitted: (value) {
              var getWeatherCubir = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubir.getweather(cityName: value);
              Navigator.pop(context);
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
