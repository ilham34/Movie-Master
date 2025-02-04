import 'package:flutter/widgets.dart';

class VideoTitle extends StatelessWidget {
  final String title;
  const VideoTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20
      ),
    );
  }
}