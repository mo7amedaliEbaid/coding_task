import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/series.dart';
import 'series_repository.dart';

class SeriesRepositoryImpl implements SeriesRepository {
  @override
  Future<Series> fetchSeries() async {
    final response = await rootBundle.loadString('assets/series.json');
    final data = json.decode(response);
    return Series.fromJson(data['series']);
  }
}
