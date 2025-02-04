import 'package:netflix_app/data/tv/models/tv_keywords_model.dart';
import 'package:netflix_app/domain/tv/entities/tv_keyword_entity.dart';

class KeywordsMapper {
  static KeywordsEntity toEntity(KeywordsModel keywordModel) {
    return KeywordsEntity(
      id: keywordModel.id,
      name: keywordModel.name,
    );
  }
}
