import '../models/series.dart';

abstract class SeriesRepository {
  Future<Series> fetchSeries();
}
