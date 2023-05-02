import 'package:flutter/material.dart';

class NewsFeedPage extends StatelessWidget {
  final List<Activity> activities = [
    Activity(
      title: 'Played fetch',
      description: 'Played fetch with a ball for 30 minutes',
      timestamp: DateTime.now(),
    ),
    Activity(
      title: 'Took a nap',
      description: 'Took a 2-hour nap in the sun',
      timestamp: DateTime.now().subtract(const Duration(hours: 3)),
    ),
    Activity(
      title: 'Visited the vet',
      description: 'Went to the vet for a checkup and vaccinations',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Activity(
      title: 'Went for a walk',
      description: 'Went for a 45-minute walk around the neighborhood',
      timestamp: DateTime.now().subtract(const Duration(days: 2)),
    ),
  ];

  NewsFeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {
          final activity = activities[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2.0,
                  blurRadius: 2.0,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  activity.description,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  '${activity.timestamp.day}/${activity.timestamp.month}/${activity.timestamp.year} at ${activity.timestamp.hour}:${activity.timestamp.minute}',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Activity {
  final String title;
  final String description;
  final DateTime timestamp;

  const Activity({
    required this.title,
    required this.description,
    required this.timestamp,
  });
}
