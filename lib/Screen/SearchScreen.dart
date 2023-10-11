import 'package:first_project/Manager/cubit/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
                    ));
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              onFieldSubmitted: (value) {
                var WeatherCubitVar = BlocProvider.of<WeatherCubit>(context);
                WeatherCubitVar.getWeather(city: value);
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                labelText: "City Name",
                prefix: Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(Icons.location_city),
                ),
                border: OutlineInputBorder(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
