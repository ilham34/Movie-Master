import 'package:flutter/material.dart';
import 'package:netflix_app/common/widgets/app_bar.dart';
import 'package:netflix_app/common/widgets/watch_page/tv_keywords.dart';
import 'package:netflix_app/common/widgets/watch_page/tv_recommendations.dart';
import 'package:netflix_app/common/widgets/watch_page/video_overview.dart';
import 'package:netflix_app/common/widgets/watch_page/video_player_tv.dart';
import 'package:netflix_app/common/widgets/watch_page/video_release_date.dart';
import 'package:netflix_app/common/widgets/watch_page/video_title.dart';
import 'package:netflix_app/common/widgets/watch_page/video_vote_average.dart';
import 'package:netflix_app/domain/tv/entities/tv_entity.dart';

class TvWatchPage extends StatelessWidget {
  final TvEntity tvEntity;
  const TvWatchPage({required this.tvEntity, super.key});

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
            VideoPlayerTv(id: tvEntity.id!),
            const SizedBox(height: 12),
            VideoTitle(title: tvEntity.name!),
            const SizedBox(height: 16),
            TvKeywords(tvId: tvEntity.id!),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoReleaseDate(releaseDate: tvEntity.firstAirDate!),
                VideoVoteAverage(voteAverage: tvEntity.voteAverage!),
              ],
            ),
            const SizedBox(height: 16),
            VideoOverview(overview: tvEntity.overview!),
            const SizedBox(height: 16),
            const Text(
              'Recommendations',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 12),
            TvRecommendations(tvId: tvEntity.id!),
          ],
        ),
      ),
    );
  }
}
