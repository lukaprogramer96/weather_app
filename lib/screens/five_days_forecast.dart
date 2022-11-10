import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../blocs/bloc/five_days_forecast_bloc.dart';

class FiveDaysForecast extends StatelessWidget {
  const FiveDaysForecast(
      {required this.cityName, this.numberOfDays, super.key});
  final String cityName;
  final int? numberOfDays;

  @override
  Widget build(BuildContext context) {
    String? dropdownValue;
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
    return BlocProvider(
      create: (context) => FiveDaysForecastBloc()
        ..add(GetFiveDaysForecastData(cityName, numberOfDays ?? 5)),
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
