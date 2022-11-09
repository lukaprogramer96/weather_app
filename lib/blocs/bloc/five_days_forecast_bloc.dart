// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repository/weather_repository.dart';
import '../../models/forecast_object_model.dart';

part 'five_days_forecast_event.dart';
part 'five_days_forecast_state.dart';

class FiveDaysForecastBloc
    extends Bloc<FiveDaysForecastEvent, FiveDaysForecastState> {
  FiveDaysForecastBloc() : super(FiveDaysForecastInitial()) {
    on<GetFiveDaysForecastData>((event, emit) async {
      emit(ForecastIsLoading());
      try {
        final weatherObjectModel =
            await WeatherRepository.getFiveDaysForecast(event.fiveDaysForecast);
        if (weatherObjectModel == null) {
          emit(const ForecastNotLoaded('Error'));
        } else {
          final weatherFromForecastObject = weatherObjectModel.forecast;
          emit(ForecastIsLoaded(weatherFromForecastObject));
        }
      } catch (e) {
        emit(ForecastNotLoaded(e.toString()));
      }
    });
  }
}
