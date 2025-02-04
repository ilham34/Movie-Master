import 'package:dartz/dartz.dart';

abstract class TvRepository {
  Future<Either> getPopularTv();
  Future<Either> getRecommendationTv(int tvId);
  Future<Either> getTvTrailer(int tvId);
  Future<Either> getKeywords(int tvId);
  Future<Either> searchTv(String query);
}
