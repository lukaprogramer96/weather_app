part of 'five_days_forecast_bloc.dart';

abstract class FiveDaysForecastState extends Equatable {
  const FiveDaysForecastState();

  @override
  List<Object> get props => [];
}

class FiveDaysForecastInitial extends FiveDaysForecastState {}

class ForecastIsLoading extends FiveDaysForecastState {}

class ForecastIsLoaded extends FiveDaysForecastState {
  final ForecastObjectModel? forecastObjectModel;

  const ForecastIsLoaded(this.forecastObjectModel);
}

class ForecastNotLoaded extends FiveDaysForecastState {
  const ForecastNotLoaded(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}

class SelectedDayState extends FiveDaysForecastState {
  final String selectedDay;

  const SelectedDayState(this.selectedDay);

  @override
  // ignore: unnecessary_this
  List<Object> get props => [this.selectedDay];
}
