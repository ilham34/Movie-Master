import 'package:dartz/dartz.dart';
import 'package:netflix_app/core/usecase/usecase.dart';
import 'package:netflix_app/domain/tv/repositories/tv.dart';
import 'package:netflix_app/service_locator.dart';

class GetTvKeywords extends Usecase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return await sl<TvRepository>().getKeywords(params!);
  }
}
