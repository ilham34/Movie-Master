import 'package:dartz/dartz.dart';
import 'package:netflix_app/core/usecase/usecase.dart';
import 'package:netflix_app/domain/movie/repositories/movie.dart';
import 'package:netflix_app/service_locator.dart';

class GetMovieTrailerUsecase extends Usecase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return await sl<MovieRepository>().getMovieTrailer(params!);
  }
  
}