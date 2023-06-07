class Pais {
  final String id;
  final String nome;
  final String imagem;

  Pais({
    required this.id,
    required this.nome,
    required this.imagem,
  });

  factory Pais.fromJson(Map<String, dynamic> json) => Pais(
        id: json["id"],
        nome: json["nome"],
        imagem: json["imagem"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "imagem": imagem,
      };
}
