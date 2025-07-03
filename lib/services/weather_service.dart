import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherService {
  final dio = Dio();

  final String baseUrl =
      'http://api.weatherapi.com/v1/forecast.json?key=e7ca6e1b196f4f2cbd794429240711';

  Future<List<WeatherModel>> getWeatherData({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl&q=$cityName&days=1&aqi=no&alerts=no',
      );
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> weatherData = jsonData['location'];
      List<WeatherModel> weatherDataList = [];
      for (var weather in weatherData) {
        WeatherModel weatherModel = WeatherModel.fromJson(weather);
        weatherDataList.add(weatherModel);
      }
      return weatherDataList;
    } catch (e) {
      return [];
    }
  }
}
