class KeywordsModel {
    KeywordsModel({
        required this.name,
        required this.id,
    });

    final String? name;
    final int? id;

    factory KeywordsModel.fromJson(Map<String, dynamic> json){ 
        return KeywordsModel(
            name: json["name"],
            id: json["id"],
        );
    }

}