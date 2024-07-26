import 'package:flutter/material.dart';
import '../models/series.dart';
import '../widgets/coach_overview_widget.dart';
import '../widgets/social_post_widget.dart';

class SeriesDetailScreen extends StatelessWidget {
  final Series series;

  const SeriesDetailScreen({super.key, required this.series});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(series.name),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Overview'),
              Tab(text: 'Classes'),
              Tab(text: 'Community'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OverviewTab(series: series),
            ClassesTab(series: series),
            CommunityTab(series: series),
          ],
        ),
      ),
    );
  }
}

class OverviewTab extends StatelessWidget {
  final Series series;

  const OverviewTab({super.key, required this.series});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.network(series.coverPhoto),
          const SizedBox(height: 10,),
          Text(series.description),
          const Text('Coaches'),
          Column(
            children: series.coaches.map((coach) => CoachOverviewWidget(coach: coach)).toList(),
          ),
        ],
      ),
    );
  }
}

class ClassesTab extends StatelessWidget {
  final Series series;

  const ClassesTab({super.key, required this.series});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: series.classes.length,
      itemBuilder: (context, index) {
        final classItem = series.classes[index];
        return ListTile(
          title: Text(classItem.name),
          subtitle: Text(classItem.duration),
        );
      },
    );
  }
}

class CommunityTab extends StatelessWidget {
  final Series series;

  const CommunityTab({super.key, required this.series});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: series.socialPosts.length,
      itemBuilder: (context, index) {
        final post = series.socialPosts[index];
        return SocialPostWidget(post: post);
      },
    );
  }
}
