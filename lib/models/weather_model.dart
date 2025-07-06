class WeatherModel {
  final String name;
  final double tempC;
  final String? icon;
  final double maxtempC;
  final double mintempC;
  final DateTime lastUpdated;
  final String weatherStatus;

  WeatherModel({
    this.icon,
    required this.name,
    required this.tempC,
    required this.mintempC,
    required this.maxtempC,
    required this.lastUpdated,
    required this.weatherStatus,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      name: json['location']['name'] ?? '',
      lastUpdated: DateTime.parse(json['current']['last_updated'] ?? ''),
      tempC: json['current']['temp_c'] ?? 0,
      icon: json['current']['condition']['icon'] ?? '',
      maxtempC: json['forecast']['forecastday'][0]['day']['maxtemp_c'] ?? 0,
      mintempC: json['forecast']['forecastday'][0]['day']['mintemp_c'] ?? 0,
      weatherStatus: json['current']['condition']['text'] ?? '',
    );
  }
}
