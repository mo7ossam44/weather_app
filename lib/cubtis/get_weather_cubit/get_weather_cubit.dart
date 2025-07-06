import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubtis/get_weather_cubit/get_weather_states.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(InitialState());

  WeatherModel? weatherModel;

  getweather({required String cityName}) async {
    try {
      weatherModel = await WeatherService().getWeatherData(cityName: cityName);
      emit(WeatherLoadeddState());
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
