import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/series_repository.dart';
import 'series_event.dart';
import 'series_state.dart';

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {
  final SeriesRepository repository;

  SeriesBloc(this.repository) : super(SeriesInitial()) {
    on<LoadSeriesEvent>((event, emit) async {
      emit(SeriesLoading());
      try {
        final series = await repository.fetchSeries();
        emit(SeriesLoaded(series));
      } catch (e) {
        emit(SeriesError(e.toString()));
      }
    });
  }
}
