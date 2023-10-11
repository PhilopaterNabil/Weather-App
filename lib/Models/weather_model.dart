class WeatherModel {
  final String cityName;
  final String lastDate;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String image;
  final String weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.image,
    required this.lastDate,
    required this.maxTemp,
    required this.minTemp,
    required this.temp,
    required this.weatherCondition,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json["location"]["name"],
      image: json["current"]["condition"]["icon"],
      lastDate: json["current"]["last_updated"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      temp: json["current"]["temp_c"],
      weatherCondition: json["current"]["condition"]["text"],
    );
  }
}
