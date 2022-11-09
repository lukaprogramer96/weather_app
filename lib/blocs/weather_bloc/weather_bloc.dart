// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/data/repository/weather_repository.dart';

import '../../models/weather_object_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherIsNotSearched()) {
    on<GetWeatherData>((event, emit) async {
      emit(WeatherIsLoading());
      try {
        final weatherObjectModel =
            await WeatherRepository.getWeather(event.weatherInfo);
        emit(WeatherIsLoaded(weatherObjectModel));
      } catch (e) {
        emit(
          WeatherIsNotLoaded(e.toString()),
        );
      }
    });
    on<ResetWeather>((event, emit) {
      emit(WeatherIsNotSearched());
    });
  }
}
