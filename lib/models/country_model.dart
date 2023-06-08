import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'countryData': countryData.toMap(),
      'contries': countries,
    };
  }

  factory CountryQuizInfo.fromMap(Map<String, dynamic> map) {
    return CountryQuizInfo(
      countryData:
          CountryDataModel.fromMap(map['countryData'] as Map<String, dynamic>),
      countries: List<String>.from((map['countries'])),
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryQuizInfo.fromJson(String source) =>
      CountryQuizInfo.fromMap(json.decode(source) as Map<String, dynamic>);
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

  factory CountryDataModel.fromMap(Map<String, dynamic> json) =>
      CountryDataModel(
        id: json["id"],
        nome: json["nome"],
        imagem: json["imagem"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "imagem": imagem,
      };
}
