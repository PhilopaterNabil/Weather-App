import 'package:dio/dio.dart';
import 'package:first_project/Models/weather_model.dart';

class WeatherService {
  late WeatherModel weatherModel;

  Dio dio = Dio();
  String baseUrl = "http://api.weatherapi.com/v1";
  String Key = "4f41864f70944643aa7110424232009";

  bool isloading = true;

  Future<WeatherModel> getWeatherDAta({required String cityName}) async {
    Response response = await dio.get(
        "$baseUrl/forecast.json?key=$Key&q=$cityName&days=1&aqi=no&alerts=no");
    weatherModel = WeatherModel.fromJson(response.data);
    return weatherModel;
  }
}
