import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/weather_bloc/weather_bloc.dart';
import '../models/weather_object_model.dart';
import 'five_days_forecast.dart';

// ignore: must_be_immutable
class ShowWeather extends StatelessWidget {
  WeatherObjectModel? weatherObjectModel;

  ShowWeather({this.weatherObjectModel, super.key});

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: const ButtonStyle(
                    foregroundColor:
                        MaterialStatePropertyAll<Color>(Colors.black),
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.amber)),
                onPressed: () {
                  weatherBloc.add(ResetWeather());
                },
                child: const Icon(
                  Icons.close,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Center(
              child: Column(children: [
                Text(
                  'City: ${weatherObjectModel!.location.name}',
                  style: const TextStyle(color: Colors.amber, fontSize: 30),
                ),
                Text(
                  'Temperature (Celsius): ${weatherObjectModel!.current.tempC}',
                  style: const TextStyle(color: Colors.amber, fontSize: 30),
                ),
                FiveDaysForecast(cityName: weatherObjectModel!.location.name)
              ]),
            ),
          ),
        ],
      ),
    );
    // return Container(
    //     padding: EdgeInsets.only(right: 32, left: 32, top: 10),
    //     child: Column(
    //       children: <Widget>[
    //         Text(
    //           locations,
    //           style: TextStyle(
    //               color: Colors.white70,
    //               fontSize: 30,
    //               fontWeight: FontWeight.bold),
    //         ),
    //         SizedBox(
    //           height: 10,
    //         ),
    //         Text(
    //           weather.getTemp.round().toString() + "C",
    //           style: TextStyle(color: Colors.white70, fontSize: 50),
    //         ),
    //         Text(
    //           "Temprature",
    //           style: TextStyle(color: Colors.white70, fontSize: 14),
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: <Widget>[
    //             Column(
    //               children: <Widget>[
    //                 Text(
    //                   weather.getMinTemp.round().toString() + "C",
    //                   style: TextStyle(color: Colors.white70, fontSize: 30),
    //                 ),
    //                 Text(
    //                   "Min Temprature",
    //                   style: TextStyle(color: Colors.white70, fontSize: 14),
    //                 ),
    //               ],
    //             ),
    //             Column(
    //               children: <Widget>[
    //                 Text(
    //                   weather.getMaxTemp.round().toString() + "C",
    //                   style: TextStyle(color: Colors.white70, fontSize: 30),
    //                 ),
    //                 Text(
    //                   "Max Temprature",
    //                   style: TextStyle(color: Colors.white70, fontSize: 14),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         Container(
    //           width: double.infinity,
    //           height: 50,
    //           child: FlatButton(
    //             shape: new RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.all(Radius.circular(10))),
    //             onPressed: () {
    //               BlocProvider.of<WeatherBloc>(context).add(ResetWeather());
    //             },
    //             color: Colors.lightBlue,
    //             child: Text(
    //               "Search",
    //               style: TextStyle(color: Colors.white70, fontSize: 16),
    //             ),
    //           ),
    //         )
    //       ],
    //     ));
  }
}
