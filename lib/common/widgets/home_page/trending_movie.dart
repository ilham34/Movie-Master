import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/common/widgets/home_page/shimmer_trending.dart';
import 'package:netflix_app/core/configs/assets/app_images.dart';
import 'package:netflix_app/presentation/home/bloc/trendings_state.dart';
import 'package:netflix_app/presentation/home/bloc/trendins_cubit.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingsCubit()..getTrendingMovies(),
      child: BlocBuilder<TrendingsCubit, TrendingsState>(
        builder: (context, state) {
          if (state is TrendingMoviesLoading) {
            return const ShimmerTrending();
          }
          if (state is TrendingMoviesLoaded) {
            return FanCarouselImageSlider.sliderType1(
              imagesLink:
                  state.movies.map((item) => AppImages.movieImagesBasePath + item.posterPath.toString()).toList(),
              isAssets: false,
              autoPlay: false,
              sliderHeight: 400,
              showIndicator: true,
            );
          }
          if (state is FailureLoadTrendingMovies) {
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
