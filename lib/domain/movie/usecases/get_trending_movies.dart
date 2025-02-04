import 'package:dartz/dartz.dart';
import 'package:netflix_app/core/usecase/usecase.dart';
import 'package:netflix_app/domain/movie/repositories/movie.dart';
import 'package:netflix_app/service_locator.dart';

class GetTrendingMoviesUsecase extends Usecase<Either, dynamic> {
  
  @override
  Future<Either> call({params}) async {
    return await sl<MovieRepository>().getTrendingMovies();
  }
}
