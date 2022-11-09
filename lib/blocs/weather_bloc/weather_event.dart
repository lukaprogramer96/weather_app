part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherData extends WeatherEvent {
  final String weatherInfo;

  const GetWeatherData(this.weatherInfo);
}

class ResetWeather extends WeatherEvent {}
