import 'package:flutter_test/flutter_test.dart';
import 'package:task_inov/models/coach.dart';

void main() {
  group('Coach', () {
    test('fromJson should return a valid Coach object', () {
      final json = {
        'id': '1',
        'name': 'Coach A',
        'photo': 'assets/images/coach_a.jpg',
        'bio': 'Expert yoga instructor.',
      };

      final coach = Coach.fromJson(json);

      expect(coach.id, '1');
      expect(coach.name, 'Coach A');
      expect(coach.photo, 'assets/images/coach_a.jpg');
      expect(coach.bio, 'Expert yoga instructor.');
    });
  });
}
