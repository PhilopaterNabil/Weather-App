import 'package:dio/dio.dart';
import 'package:first_project/weather_model.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late WEatherModel weatherModel;

  Dio dio = Dio();
  String baseUrl = "http://api.weatherapi.com/v1";
  String ApiKey = "4f41864f70944643aa7110424232009";
  String CityName = "Sohag";

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  Future<void> getWeatherData() async {
    Response response = await dio.get(
        "$baseUrl/forecast.json?key=$ApiKey&q=$CityName&days=1&aqi=no&alerts=no");
    weatherModel = WEatherModel.fromJson(response.data);
    setState(() {});
    isLoading = false;

    print(weatherModel.image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Weather App"),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${weatherModel.cityName}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Text(
                    'updated at ${weatherModel.lastDate}',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        "https://img.freepik.com/premium-vector/weather-forecast-partly-sunny-icon-flat-color-style_755164-384.jpg",
                        height: 100,
                      ),
                      Text(
                        '${weatherModel.temp}°C',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'Maxtemp: ${weatherModel.maxTemp}°C',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Mintemp: ${weatherModel.minTemp}°C',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    '${weatherModel.weatherCondition}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
