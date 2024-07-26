import 'package:flutter_test/flutter_test.dart';
import 'package:task_inov/models/series.dart';

void main() {
  group('Series', () {
    test('fromJson should return a valid Series object', () {
      final json = {
        'id': '1',
        'name': 'Yoga for Beginners',
        'coverPhoto': 'assets/images/yoga_cover.jpg',
        'overviewVideo': 'assets/videos/yoga_overview.mp4',
        'description': 'A comprehensive yoga series for beginners.',
        'coaches': [
          {
            'id': '1',
            'name': 'Coach A',
            'photo': 'assets/images/coach_a.jpg',
            'bio': 'Expert yoga instructor.'
          },
          {
            'id': '2',
            'name': 'Coach B',
            'photo': 'assets/images/coach_b.jpg',
            'bio': 'Certified yoga teacher.'
          }
        ],
        'classes': [
          {
            'id': '1',
            'name': 'Yoga Class 1',
            'duration': '30 mins'
          },
          {
            'id': '2',
            'name': 'Yoga Class 2',
            'duration': '45 mins'
          }
        ],
        'socialPosts': [
          {
            'id': '1',
            'user': 'User 1',
            'content': 'Loving this series!',
            'timestamp': '2023-07-01T12:34:56Z'
          },
          {
            'id': '2',
            'user': 'User 2',
            'content': 'Great session today.',
            'timestamp': '2023-07-02T14:23:11Z'
          }
        ]
      };

      final series = Series.fromJson(json);

      expect(series.id, '1');
      expect(series.name, 'Yoga for Beginners');
      expect(series.coverPhoto, 'assets/images/yoga_cover.jpg');
      expect(series.overviewVideo, 'assets/videos/yoga_overview.mp4');
      expect(series.description, 'A comprehensive yoga series for beginners.');
      expect(series.coaches.length, 2);
      expect(series.classes.length, 2);
      expect(series.socialPosts.length, 2);
    });
  });
}
