import 'package:dartz/dartz.dart';
import 'package:netflix_app/core/usecase/usecase.dart';
import 'package:netflix_app/domain/tv/repositories/tv.dart';
import 'package:netflix_app/service_locator.dart';

class SearchTvUsecase extends Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<TvRepository>().searchTv(params!);
  }
}