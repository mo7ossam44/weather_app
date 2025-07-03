class WeatherModel {
  final String name;
  final String lastUpdated;
  final String tempC;
  final String icon;
  final String maxtempC;
  final String mintempC;
  final String weatherStatus;

  WeatherModel({
    required this.name,
    required this.lastUpdated,
    required this.tempC,
    required this.icon,
    required this.maxtempC,
    required this.mintempC,
    required this.weatherStatus,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      name: json['location']['name'],
      lastUpdated: json['current']['last_updated'],
      tempC: json['current']['temp_c'],
      icon: json['current']['condition']['icon'],
      maxtempC: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mintempC: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherStatus: json['current']['condition']['text'],
    );
  }
}
