import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/domain/movie/entities/movie_trailer_entity.dart';
import 'package:netflix_app/domain/movie/usecases/get_movie_trailer.dart';
import 'package:netflix_app/domain/tv/usecase/get_trailer_tv.dart';
import 'package:netflix_app/presentation/watch/bloc/trailer_state.dart';
import 'package:netflix_app/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());

  void getMovieTrailer(int movieId) async {
    final result = await sl<GetMovieTrailerUsecase>().call(params: movieId);
    result.fold(
      (error) {
        emit(TrailerFailure(errorMessage: error));
      },
      (data) async {
        TrailerEntity trailerEntity = data;
        YoutubePlayerController controller = YoutubePlayerController(
          initialVideoId: trailerEntity.key!,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          )
        );
        emit(TrailerLoaded(youtubeController: controller));
      },
    );
  }

  void getTvTrailer(int tvId) async {
    final result = await sl<GetTrailerTvUsecase>().call(params: tvId);
    result.fold(
      (error) {
        emit(TrailerFailure(errorMessage: error));
      },
      (data) async {
        TrailerEntity trailerEntity = data;
        YoutubePlayerController controller = YoutubePlayerController(
          initialVideoId: trailerEntity.key!,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          )
        );
        emit(TrailerLoaded(youtubeController: controller));
      },
    );
  }
}
