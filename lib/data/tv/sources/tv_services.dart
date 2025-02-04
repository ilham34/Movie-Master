import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netflix_app/core/constants/api_url.dart';
import 'package:netflix_app/core/network/dio_client.dart';
import 'package:netflix_app/service_locator.dart';

abstract class TvServices {
  Future<Either> getPopularTv();
  Future<Either> getRecommendationTv(int tvId);
  Future<Either> getTvTrailer(int tvId);
  Future<Either> getKeywords(int tvId);
  Future<Either> searchTv(String query);
}

class TvServiceImpl extends TvServices {
  @override
  Future<Either> getPopularTv() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.popularTv,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['messsage']);
    }
  }

  @override
  Future<Either> getTvTrailer(int tvId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.tv}/$tvId/trailers',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['messsage']);
    }
  }

  @override
  Future<Either> getRecommendationTv(int tvId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.tv}/$tvId/recommendations',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['messsage']);
    }
  }
  
  @override
  Future<Either> getKeywords(int tvId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.tv}/$tvId/keywords',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['messsage']);
    }
  }
  
  @override
  Future<Either> searchTv(String query) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.search}/tv/$query',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['messsage']);
    }
  }
}
