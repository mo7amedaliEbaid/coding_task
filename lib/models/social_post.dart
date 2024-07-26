class SocialPost {
  final String id;
  final String user;
  final String content;
  final DateTime timestamp;

  SocialPost({required this.id, required this.user, required this.content, required this.timestamp});

  factory SocialPost.fromJson(Map<String, dynamic> json) {
    return SocialPost(
      id: json['id'],
      user: json['user'],
      content: json['content'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
