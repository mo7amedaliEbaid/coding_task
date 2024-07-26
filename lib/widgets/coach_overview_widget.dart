import 'package:flutter/material.dart';
import '../models/coach.dart';

class CoachOverviewWidget extends StatelessWidget {
  final Coach coach;

  const CoachOverviewWidget({super.key, required this.coach});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(coach.photo),
      title: Text(coach.name),
      subtitle: Text(coach.bio),
    );
  }
}
