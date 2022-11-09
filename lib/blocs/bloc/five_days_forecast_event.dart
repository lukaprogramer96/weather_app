part of 'five_days_forecast_bloc.dart';

abstract class FiveDaysForecastEvent extends Equatable {
  const FiveDaysForecastEvent();

  @override
  List<Object> get props => [];
}

class GetFiveDaysForecastData extends FiveDaysForecastEvent {
  final String fiveDaysForecast;

  const GetFiveDaysForecastData(this.fiveDaysForecast);
}
