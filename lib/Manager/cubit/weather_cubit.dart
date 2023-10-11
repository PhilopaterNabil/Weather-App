import 'package:bloc/bloc.dart';
import 'package:first_project/Services/weather_service.dart';
import 'package:first_project/Models/weather_model.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  getWeather({required String city}) async {
    try {
      WeatherModel weatherModel =
          await WeatherService().getWeatherDAta(cityName: city);
      emit(WeatherLoaded(weatherModel: weatherModel));
    } on Exception catch (e) {
      emit(WeatherFailure());
    }
  }
}
