part of 'weather_cubit.dart';

abstract class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoaded extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoaded({required this.weatherModel});
}

final class WeatherFailure extends WeatherState {}
