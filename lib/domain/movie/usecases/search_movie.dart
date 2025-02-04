import 'package:dartz/dartz.dart';
import 'package:netflix_app/core/usecase/usecase.dart';
import 'package:netflix_app/domain/movie/repositories/movie.dart';
import 'package:netflix_app/service_locator.dart';

class SearchMoviesUsecase extends Usecase<Either, String> {
  
  @override
  Future<Either> call({String? params}) async {
    return await sl<MovieRepository>().searchMovies(params!);
  }
}