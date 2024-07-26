import '../models/series.dart';

abstract class SeriesState {}

class SeriesInitial extends SeriesState {}

class SeriesLoading extends SeriesState {}

class SeriesLoaded extends SeriesState {
  final Series series;

  SeriesLoaded(this.series);
}

class SeriesError extends SeriesState {
  final String message;

  SeriesError(this.message);
}
