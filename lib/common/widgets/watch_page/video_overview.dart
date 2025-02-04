import 'package:flutter/material.dart';

class VideoOverview extends StatelessWidget {
  final String overview;
  const VideoOverview({required this.overview, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Overview',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          overview.isEmpty ? 'No overview' : overview,
          style: Theme.of(context).primaryTextTheme.bodyMedium,
        )
      ],
    );
  }
}
