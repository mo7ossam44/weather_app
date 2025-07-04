import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherService {
  final dio = Dio();

  final String baseUrl = 'http://api.weatherapi.com/v1/forecast.json';
  final String apiKey = 'e7ca6e1b196f4f2cbd794429240711';

  Future<WeatherModel> getWeatherData({required String cityName}) async {
    try {
      Response response = await dio.get(
        'http://api.weatherapi.com/v1/forecast.json?key=e7ca6e1b196f4f2cbd794429240711&q=$cityName&days=1',
      );
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ??
          'oops there was an error, tray again later!';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error, tray again later!');
    }
  }
}
