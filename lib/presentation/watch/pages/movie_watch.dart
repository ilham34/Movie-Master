import 'package:flutter/material.dart';
import 'package:netflix_app/common/widgets/app_bar.dart';
import 'package:netflix_app/common/widgets/watch_page/video_recommendations.dart';
import 'package:netflix_app/common/widgets/watch_page/video_overview.dart';
import 'package:netflix_app/common/widgets/watch_page/video_release_date.dart';
import 'package:netflix_app/common/widgets/watch_page/video_title.dart';
import 'package:netflix_app/common/widgets/watch_page/video_player.dart';
import 'package:netflix_app/common/widgets/watch_page/video_vote_average.dart';
import 'package:netflix_app/domain/movie/entities/movie_entity.dart';

class MovieWatchPage extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieWatchPage({required this.movieEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(id: movieEntity.id!),
            const SizedBox(height: 12),
            VideoTitle(title: movieEntity.title!),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(builder: (context) {
                  if (movieEntity.releaseDate != null) {
                    return VideoReleaseDate(releaseDate: movieEntity.releaseDate!);
                  }
                  return VideoReleaseDate(releaseDate: DateTime(1600));
                }),
                VideoVoteAverage(voteAverage: movieEntity.voteAverage!),
              ],
            ),
            const SizedBox(height: 16),
            VideoOverview(overview: movieEntity.overview!),
            const SizedBox(height: 16),
            const Text(
              'Recommendations',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 12),
            VideoRecommendations(movieId: movieEntity.id!),
          ],
        ),
      ),
    );
  }
}
