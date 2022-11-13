import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/five_days_forecast_bloc.dart';
import '../blocs/weather_bloc/weather_bloc.dart';
import 'search_view.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      appBar: AppBar(
        title: Text(title),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => WeatherBloc(),
          ),
          BlocProvider(
            create: (context) => FiveDaysForecastBloc(),
          ),
        ],
        child: const SearchView(),
      ),
    );
  }
}
