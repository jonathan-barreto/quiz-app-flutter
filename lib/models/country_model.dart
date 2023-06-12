class CountryQuizInfo {
  final CountryDataModel countryData;
  final List<String> countries;

  CountryQuizInfo({
    required this.countryData,
    required this.countries,
  });

  List<String> get countriesRandom {
    List<String> countriesNews = [...countries];
    countriesNews.add(countryData.nome);
    countriesNews.shuffle();
    return countriesNews;
  }

  factory CountryQuizInfo.fromJson(Map<String, dynamic> json) {
    return CountryQuizInfo(
      countryData:
          CountryDataModel.fromMap(json['countryData'] as Map<String, dynamic>),
      countries: List<String>.from((json['countries'])),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'countryData': countryData.toMap(),
      'contries': countries,
    };
  }
}

class CountryDataModel {
  final String id;
  final String nome;
  final String imagem;

  CountryDataModel({
    required this.id,
    required this.nome,
    required this.imagem,
  });

  factory CountryDataModel.fromMap(Map<String, dynamic> json) {
    return CountryDataModel(
      id: json["id"],
      nome: json["nome"],
      imagem: json["imagem"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome,
      "imagem": imagem,
    };
  }
}
