import 'coach.dart';
import 'social_post.dart';

class Series {
  final String id;
  final String name;
  final String coverPhoto;
  final String overviewVideo;
  final String description;
  final List<Coach> coaches;
  final List<Class> classes;
  final List<SocialPost> socialPosts;

  Series({
    required this.id,
    required this.name,
    required this.coverPhoto,
    required this.overviewVideo,
    required this.description,
    required this.coaches,
    required this.classes,
    required this.socialPosts,
  });

  factory Series.fromJson(Map<String, dynamic> json) {
    var coaches = (json['coaches'] as List).map((i) => Coach.fromJson(i)).toList();
    var classes = (json['classes'] as List).map((i) => Class.fromJson(i)).toList();
    var socialPosts = (json['socialPosts'] as List).map((i) => SocialPost.fromJson(i)).toList();

    return Series(
      id: json['id'],
      name: json['name'],
      coverPhoto: json['coverPhoto'],
      overviewVideo: json['overviewVideo'],
      description: json['description'],
      coaches: coaches,
      classes: classes,
      socialPosts: socialPosts,
    );
  }
}

class Class {
  final String id;
  final String name;
  final String duration;

  Class({required this.id, required this.name, required this.duration});

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
      id: json['id'],
      name: json['name'],
      duration: json['duration'],
    );
  }
}
