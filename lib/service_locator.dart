import 'package:get_it/get_it.dart';
import 'package:netflix_app/core/network/dio_client.dart';
import 'package:netflix_app/data/auth/sources/auth_api_service.dart';
import 'package:netflix_app/data/movie/repositories/movie.dart';
import 'package:netflix_app/data/movie/sources/movie_service.dart';
import 'package:netflix_app/data/tv/repositories/tv.dart';
import 'package:netflix_app/data/tv/sources/tv_services.dart';
import 'package:netflix_app/domain/auth/repositories/auth.dart';
import 'package:netflix_app/domain/auth/usecases/is_logged_in.dart';
import 'package:netflix_app/domain/auth/usecases/signin.dart';
import 'package:netflix_app/domain/auth/usecases/signup.dart';
import 'package:netflix_app/domain/movie/repositories/movie.dart';
import 'package:netflix_app/domain/movie/usecases/get_movie_recommendations.dart';
import 'package:netflix_app/domain/movie/usecases/get_movie_trailer.dart';
import 'package:netflix_app/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:netflix_app/domain/movie/usecases/get_trending_movies.dart';
import 'package:netflix_app/domain/movie/usecases/search_movie.dart';
import 'package:netflix_app/domain/tv/repositories/tv.dart';
import 'package:netflix_app/domain/tv/usecase/get_popular_tv.dart';
import 'package:netflix_app/domain/tv/usecase/get_recommendations_tv.dart';
import 'package:netflix_app/domain/tv/usecase/get_trailer_tv.dart';
import 'package:netflix_app/domain/tv/usecase/get_tv_keywords.dart';
import 'package:netflix_app/domain/tv/usecase/search_tv.dart';

import 'data/auth/repositories/auth.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieService>(MovieServiceImpl());
  sl.registerSingleton<TvServices>(TvServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  sl.registerSingleton<TvRepository>(TvRepositoryImpl());

  // Usecases
  sl.registerSingleton<SignUpUsecase>(SignUpUsecase());
  sl.registerSingleton<SignInUsecase>(SignInUsecase());
  sl.registerSingleton<IsLoggedInUsecase>(IsLoggedInUsecase());
  sl.registerSingleton<GetTrendingMoviesUsecase>(GetTrendingMoviesUsecase());
  sl.registerSingleton<GetNowPlayingMoviesUsecase>(GetNowPlayingMoviesUsecase());
  sl.registerSingleton<GetPopularTvUsecase>(GetPopularTvUsecase());
  sl.registerSingleton<GetMovieTrailerUsecase>(GetMovieTrailerUsecase());
  sl.registerSingleton<GetMovieRecommendationsUsecase>(GetMovieRecommendationsUsecase());
  sl.registerSingleton<GetRecommendationTvUsecase>(GetRecommendationTvUsecase());
  sl.registerSingleton<GetTrailerTvUsecase>(GetTrailerTvUsecase());
  sl.registerSingleton<GetTvKeywords>(GetTvKeywords());
  sl.registerSingleton<SearchMoviesUsecase>(SearchMoviesUsecase());
  sl.registerSingleton<SearchTvUsecase>(SearchTvUsecase());
}
