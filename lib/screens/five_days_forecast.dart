import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/five_days_forecast_bloc.dart';

class FiveDaysForecast extends StatelessWidget {
  const FiveDaysForecast({required this.cityName, super.key});
  final String cityName;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    return BlocProvider(
      create: (context) => FiveDaysForecastBloc(),
      child: BlocBuilder<FiveDaysForecastBloc, FiveDaysForecastState>(
          builder: (context, state) {
        if (state is FiveDaysForecastInitial) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: ElevatedButton(
              onPressed: () {
                // ignore: prefer_const_constructors
                BlocProvider.of<FiveDaysForecastBloc>(context)
                    .add(GetFiveDaysForecastData(cityName));
              },
              child: const Text(
                'See forecast for the next five days',
                style: TextStyle(fontSize: 15),
              ),
            ),
          );
        } else if (state is ForecastIsLoaded) {
          // return ListView.builder(
          //   itemCount: state.forecastObjectModel?.forecastDay.length,
          //   itemBuilder: (context, index) {
          //     return Card(
          //       child: Container(
          //         child: Text(
          //             'Datum: ${state.forecastObjectModel?.forecastDay[index].date}'),
          //       ),
          //     );
          //   },
          // );
          return Column(
            children: state.forecastObjectModel!.forecastDay
                .map((e) => Container(
                      child: Text(e.date),
                    ))
                .toList(),
          );
        }
        return Container();
      }),
    );
  }
}
