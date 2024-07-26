import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_inov/models/series.dart';
import 'package:task_inov/repositories/series_repository_impl.dart';


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SeriesRepositoryImpl', () {
    final repository = SeriesRepositoryImpl();

    test('fetchSeries should return a valid Series object', () async {
      const fakeResponse = '''
      {
        "series": {
          "id": "1",
          "name": "Yoga for Beginners",
          "coverPhoto": "assets/images/yoga_cover.jpg",
          "overviewVideo": "assets/videos/yoga_overview.mp4",
          "description": "A comprehensive yoga series for beginners.",
          "coaches": [
            {
              "id": "1",
              "name": "Coach A",
              "photo": "assets/images/coach_a.jpg",
              "bio": "Expert yoga instructor."
            },
            {
              "id": "2",
              "name": "Coach B",
              "photo": "assets/images/coach_b.jpg",
              "bio": "Certified yoga teacher."
            }
          ],
          "classes": [
            {
              "id": "1",
              "name": "Yoga Class 1",
              "duration": "30 mins"
            },
            {
              "id": "2",
              "name": "Yoga Class 2",
              "duration": "45 mins"
            }
          ],
          "socialPosts": [
            {
              "id": "1",
              "user": "User 1",
              "content": "Loving this series!",
              "timestamp": "2023-07-01T12:34:56Z"
            },
            {
              "id": "2",
              "user": "User 2",
              "content": "Great session today.",
              "timestamp": "2023-07-02T14:23:11Z"
            }
          ]
        }
      }
      ''';

      // Simulate reading the JSON file
      ServicesBinding.instance.defaultBinaryMessenger.setMockMessageHandler('flutter/assets', (message) async {
        final ByteData data = ByteData.view(Uint8List.fromList(utf8.encode(fakeResponse)).buffer);
        return Future.value(data);
      });

      final series = await repository.fetchSeries();

      expect(series, isA<Series>());
      expect(series.id, '1');
      expect(series.name, 'Yoga for Beginners');
    });
  });
}
