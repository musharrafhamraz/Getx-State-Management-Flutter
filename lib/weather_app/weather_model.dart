class WeatherModel {
  final double temperature;
  final double lowestTemp;
  final double highestTemp;
  final int humidity;
  final double precipitation;
  final int pressure;
  final double windSpeed;
  final String mainCondition;

  WeatherModel({
    required this.temperature,
    required this.highestTemp,
    required this.lowestTemp,
    required this.humidity,
    required this.precipitation,
    required this.pressure,
    required this.windSpeed,
    required this.mainCondition,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      mainCondition: json['current']['weather'][0]['main'],
      temperature: json['current']['temp'],
      lowestTemp: json['daily'][0]['temp']['min'],
      highestTemp: json['daily'][0]['temp']['max'],
      humidity: json['current']['humidity'],
      precipitation: json['daily'][0]['rain'] ?? 0.0,
      pressure: json['current']['pressure'],
      windSpeed: json['current']['wind_speed'],
    );
  }
}
