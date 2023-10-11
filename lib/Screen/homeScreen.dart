import 'package:first_project/Manager/cubit/weather_cubit.dart';
import 'package:first_project/Screen/SearchScreen.dart';
import 'package:first_project/Screen/no_weather.dart';
import 'package:first_project/Screen/weather_info_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Weather App"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) {
            return const NoWeatherBody();
          } else if (state is WeatherLoaded) {
            return WeatherInfoBody(weatherModel: state.weatherModel);
          } else {
            return const NoWeatherBody();
          }
        },
      ),
    );
  }
}
