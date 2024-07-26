class Coach {
  final String id;
  final String name;
  final String photo;
  final String bio;

  Coach({required this.id, required this.name, required this.photo, required this.bio});

  factory Coach.fromJson(Map<String, dynamic> json) {
    return Coach(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
      bio: json['bio'],
    );
  }
}
