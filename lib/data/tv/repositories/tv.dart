import 'package:dartz/dartz.dart';
import 'package:netflix_app/common/helper/mapper/keyword_mapper.dart';
import 'package:netflix_app/common/helper/mapper/trailer_mapper.dart';
import 'package:netflix_app/common/helper/mapper/tv_mapper.dart';
import 'package:netflix_app/data/movie/models/movie_trailer_model.dart';
import 'package:netflix_app/data/tv/models/tv_keywords_model.dart';
import 'package:netflix_app/data/tv/models/tv_model.dart';
import 'package:netflix_app/data/tv/sources/tv_services.dart';
import 'package:netflix_app/domain/tv/repositories/tv.dart';
import 'package:netflix_app/service_locator.dart';

class TvRepositoryImpl extends TvRepository {
  @override
  Future<Either> getPopularTv() async {
    var returnedData = await sl<TvServices>().getPopularTv();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content']).map((item) => TvMapper.toEntity(TvModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getRecommendationTv(int tvId) async {
    var returnedData = await sl<TvServices>().getRecommendationTv(tvId);

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content']).map((item) => TvMapper.toEntity(TvModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getTvTrailer(int tvId) async {
    var returnedData = await sl<TvServices>().getTvTrailer(tvId);

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var tvTrailer =
            List.from(data['trailers']).map((item) => TrailerMapper.toEntity(TrailerModel.fromJson(item))).toList();
        if (tvTrailer.isNotEmpty) {
          return Right(tvTrailer[0]);
        }
        return const Left('No Trailer Available!');
      },
    );
  }
  
  @override
  Future<Either> getKeywords(int tvId) async {
    var returnedData = await sl<TvServices>().getRecommendationTv(tvId);

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var keywords = List.from(data['content']).map((item) => KeywordsMapper.toEntity(KeywordsModel.fromJson(item))).toList();
        return Right(keywords);
      },
    );
  }
  
  @override
  Future<Either> searchTv(String query) async {
    var returnedData = await sl<TvServices>().searchTv(query);

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var tvList = List.from(data['content']).map((item) => TvMapper.toEntity(TvModel.fromJson(item))).toList();
        return Right(tvList);
      },
    );
  }
}
