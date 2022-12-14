part of 'five_days_forecast_bloc.dart';

abstract class FiveDaysForecastEvent extends Equatable {
  const FiveDaysForecastEvent();

  @override
  List<Object> get props => [];
}

class GetFiveDaysForecastData extends FiveDaysForecastEvent {
  final String fiveDaysForecast;
  final int inputNumber;

  const GetFiveDaysForecastData(this.fiveDaysForecast, this.inputNumber);
}

// ignore: must_be_immutable
class SelectedDayEvent extends FiveDaysForecastEvent {
  String day;
  SelectedDayEvent(this.day);

  @override
  // ignore: unnecessary_this
  List<Object> get props => [this.day];
}
