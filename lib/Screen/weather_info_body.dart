import 'package:first_project/Models/weather_model.dart';
import 'package:flutter/material.dart';

class WeatherInfoBody extends StatelessWidget {
  final WeatherModel weatherModel;
  const WeatherInfoBody({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 246, 244, 243),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${weatherModel.cityName}",
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "updated at ${weatherModel.lastDate}",
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      "http:${weatherModel.image}",
                      height: 80,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${weatherModel.temp}°C",
                    style: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text(
                        "Maxtemp: ${weatherModel.maxTemp}°C",
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "Mintemp: ${weatherModel.minTemp}°C",
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "${weatherModel.weatherCondition}",
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}
