import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/series_bloc.dart';
import '../blocs/series_state.dart';
import 'series_detail_screen.dart';

class SeriesListScreen extends StatelessWidget {
  const SeriesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Training Series'),
      ),
      body: BlocBuilder<SeriesBloc, SeriesState>(
        builder: (context, state) {
          if (state is SeriesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SeriesLoaded) {
            return ListView.builder(
              itemCount: 1,
              padding: const EdgeInsets.only(top: 30),
              itemBuilder: (context, index) {
                final series = state.series;
                return Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    title: Text(series.name),
                    leading: Image.network(series.coverPhoto, width: 50, height: 50, fit: BoxFit.contain),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SeriesDetailScreen(series: series)),
                      );
                    },
                  ),
                );
              },
            );
          } else if (state is SeriesError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('No series found'));
          }
        },
      ),
    );
  }
}
