import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../blocs/bloc/five_days_forecast_bloc.dart';
import '../blocs/weather_bloc/weather_bloc.dart';

class FiveDaysForecast extends StatelessWidget {
  const FiveDaysForecast(
      {required this.cityName, this.numberOfDays, super.key});
  final String cityName;
  final int? numberOfDays;

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    final fiveDaysForecastBloc = BlocProvider.of<FiveDaysForecastBloc>(context);

    // final mapDays = {
    //   1: 'One Day',
    //   2: 'Two Days',
    //   3: 'Three Days',
    //   4: 'Four Days',
    //   5: 'Five Days',
    //   6: 'Six Days',
    //   7: 'Seven Days',
    //   8: 'Eight Days',
    //   9: 'Nine Days',
    //   10: 'Ten',
    // };

    var days = [
      'One Day',
      'Two Days',
      'Three Days',
      'Four Days',
      'Five Days',
      'Six Days',
      'Seven Days',
      'Eight Days',
      'NineDays',
      'Ten Days'
    ];
    String? dropdownValue = days.first;

    return BlocProvider(
      create: (context) => fiveDaysForecastBloc
        ..add(GetFiveDaysForecastData(
            cityName, days.indexOf(dropdownValue!) + 1)),
      child: BlocBuilder<FiveDaysForecastBloc, FiveDaysForecastState>(
          builder: (context, state) {
        if (state is FiveDaysForecastInitial) {
          return const CircularProgressIndicator();
        } else if (state is ForecastIsLoaded) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                StatefulBuilder(
                  builder: (context, setState) {
                    return DropdownButton<String>(
                        value: dropdownValue,
                        hint: const Text('Show forecast for next X days'),
                        items: days.map((String day) {
                          return DropdownMenuItem(
                            value: day,
                            child: Text(day),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                          fiveDaysForecastBloc.add(GetFiveDaysForecastData(
                              cityName, days.indexOf(dropdownValue!) + 1));
                        });
                  },
                ),
                Column(
                    children: state.forecastObjectModel!.forecastDay.map((e) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(DateFormat('dd.MM.yyyy.')
                          .format(DateTime.parse(e.date))),
                      Text(e.day.minTempC.toString()),
                      Text(e.day.maxTempC.toString()),
                    ],
                  );
                }).toList()),
              ],
            ),
            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Column(
            //       children: state.forecastObjectModel!.forecastDay
            //           .map((e) => Padding(
            //                 padding: const EdgeInsets.all(3.0),
            //                 child: Text(
            //                     DateFormat('dd. MM. yyyy.')
            //                         .format(DateTime.parse(e.date)),
            //                     style: const TextStyle(
            //                         color: Colors.amber, fontSize: 18)),
            //               ))
            //           .toList(),
            //     ),
            //     Column(
            //       children: state.forecastObjectModel!.forecastDay
            //           .map((e) => Padding(
            //                 padding: const EdgeInsets.all(3.0),
            //                 child: Text(
            //                   'Min: ${e.day.minTempC}°',
            //                   style: const TextStyle(
            //                       color: Colors.amber, fontSize: 18),
            //                 ),
            //               ))
            //           .toList(),
            //     ),
            //     Column(
            //       children: state.forecastObjectModel!.forecastDay
            //           .map((e) => Padding(
            //                 padding: const EdgeInsets.all(3.0),
            //                 child: Text(
            //                   'Max: ${e.day.maxTempC}°',
            //                   style: const TextStyle(
            //                       color: Colors.amber, fontSize: 18),
            //                 ),
            //               ))
            //           .toList(),
            //     ),
            //   ],
            // ),
          );
        }
        return Container();
      }),
    );
  }
}
