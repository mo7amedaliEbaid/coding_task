import 'package:flutter_test/flutter_test.dart';
import 'package:task_inov/models/social_post.dart';

void main() {
  group('SocialPost', () {
    test('fromJson should return a valid SocialPost object', () {
      final json = {
        'id': '1',
        'user': 'User 1',
        'content': 'Loving this series!',
        'timestamp': '2023-07-01T12:34:56Z'
      };

      final post = SocialPost.fromJson(json);

      expect(post.id, '1');
      expect(post.user, 'User 1');
      expect(post.content, 'Loving this series!');
      expect(post.timestamp, DateTime.parse('2023-07-01T12:34:56Z'));
    });
  });
}
