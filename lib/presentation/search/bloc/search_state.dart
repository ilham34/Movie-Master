import 'package:netflix_app/domain/movie/entities/movie_entity.dart';
import 'package:netflix_app/domain/tv/entities/tv_entity.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class MovieLoaded extends SearchState {
  final List<MovieEntity> movies;
  MovieLoaded({required this.movies});
}

class TvLoaded extends SearchState {
  final List<TvEntity> tv;
  TvLoaded({required this.tv});
}

class SearchError extends SearchState {
  final String errorMessage;
  SearchError({required this.errorMessage});
}
