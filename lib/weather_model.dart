class WEatherModel {
  final String cityName;
  final String lastDate;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String image;
  final String weatherCondition;

  WEatherModel({
    required this.cityName,
    required this.image,
    required this.lastDate,
    required this.maxTemp,
    required this.minTemp,
    required this.temp,
    required this.weatherCondition,
  });

  factory WEatherModel.fromJson(json) {
    return WEatherModel(
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
