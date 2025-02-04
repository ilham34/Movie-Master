import 'package:netflix_app/data/tv/models/tv_model.dart';
import 'package:netflix_app/domain/tv/entities/tv_entity.dart';

class TvMapper {
  static TvEntity toEntity(TvModel tvModel) {
    return TvEntity(
      adult: tvModel.adult,
      backdropPath: tvModel.backdropPath,
      genreIds: tvModel.genreIds,
      id: tvModel.id,
      originCountry: tvModel.originCountry,
      originalLanguage: tvModel.originalLanguage,
      originalName: tvModel.originalName,
      overview: tvModel.overview,
      popularity: tvModel.popularity,
      posterPath: tvModel.posterPath,
      firstAirDate: tvModel.firstAirDate,
      name: tvModel.name,
      voteAverage: tvModel.voteAverage,
      voteCount: tvModel.voteCount,
    );
  }
}
