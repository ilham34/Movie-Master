import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/presentation/watch/bloc/trailer_cubit.dart';
import 'package:netflix_app/presentation/watch/bloc/trailer_state.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerTv extends StatelessWidget {
  final int id;
  const VideoPlayerTv({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrailerCubit()..getTvTrailer(id),
      child: BlocBuilder<TrailerCubit, TrailerState>(
        builder: (context, state) {
          if (state is TrailerLoading) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade700,
              highlightColor: Colors.grey.shade100,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(color: Colors.black),
              ),
            );
          }
          if (state is TrailerLoaded) {
            return YoutubePlayer(
              controller: state.youtubeController,
              showVideoProgressIndicator: true,
            );
          }
          if (state is TrailerFailure) {
            return Center(child: Text(state.errorMessage));
          }
          return Container();
        },
      ),
    );
  }
}
