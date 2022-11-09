part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherIsNotSearched extends WeatherState {}

class WeatherIsLoading extends WeatherState {}

class WeatherIsLoaded extends WeatherState {
  final WeatherObjectModel? weatherObjectModel;

  const WeatherIsLoaded(this.weatherObjectModel);
}

class WeatherIsNotLoaded extends WeatherState {
  const WeatherIsNotLoaded(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
