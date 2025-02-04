import 'package:dartz/dartz.dart';
import 'package:netflix_app/common/helper/mapper/movie_mapper.dart';
import 'package:netflix_app/common/helper/mapper/trailer_mapper.dart';
import 'package:netflix_app/data/movie/models/movie_model.dart';
import 'package:netflix_app/data/movie/models/movie_trailer_model.dart';
import 'package:netflix_app/data/movie/sources/movie_service.dart';
import 'package:netflix_app/domain/movie/repositories/movie.dart';
import 'package:netflix_app/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var returnedData = await sl<MovieService>().getTrendingMovies();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content']).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    var returnedData = await sl<MovieService>().getNowPlayingMovies();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content']).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getMovieTrailer(int movieId) async {
    var returnedData = await sl<MovieService>().getMovieTrailer(movieId);

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        if (data['trailer'] != null) {
          var movies = TrailerMapper.toEntity(TrailerModel.fromJson(data['trailer']));
          return Right(movies); 
        }
        return const Left('No Trailer Available!');
      },
    );
  }
  
  @override
  Future<Either> getRecommendationMovies(int movieId) async {
    var returnedData = await sl<MovieService>().getRecommendationMovies(movieId);

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content']).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }
  
  @override
  Future<Either> searchMovies(String query) async {
     var returnedData = await sl<MovieService>().searchMovies(query);

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content']).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }
}
