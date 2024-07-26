import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/series_event.dart';
import 'repositories/series_repository_impl.dart';
import 'blocs/series_bloc.dart';
import 'screens/series_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Training Series App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) =>
            SeriesBloc(SeriesRepositoryImpl())..add(LoadSeriesEvent()),
        child: SeriesListScreen(),
      ),
    );
  }
}
