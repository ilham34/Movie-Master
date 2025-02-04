import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/common/bloc/generic_data_cubit.dart';
import 'package:netflix_app/common/bloc/generic_data_state.dart';
import 'package:netflix_app/common/widgets/home_page/shimmer_card.dart';
import 'package:netflix_app/common/widgets/movie_card.dart';
import 'package:netflix_app/domain/movie/entities/movie_entity.dart';
import 'package:netflix_app/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:netflix_app/service_locator.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()..getData<List<MovieEntity>>(sl<GetNowPlayingMoviesUsecase>()),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const ShimmerCard();
          }
          if (state is DataLoaded) {
            return SizedBox(
              height: 400,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return MovieCard(movieEntity: state.data[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 20),
                itemCount: state.data.length,
              ),
            );
          }
          if (state is DataError) {
            return Center(
              child: Text(
                state.errorMessage,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
