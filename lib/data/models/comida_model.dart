class ComidaModel {
  final String nome;
  final String quantidade;
  final String calorias;

  ComidaModel({
    required this.nome,
    required this.quantidade,
    required this.calorias,
  });

  factory ComidaModel.fromJson(Map<String, dynamic> json) {
    return ComidaModel(
      nome: json['descricao'] ?? '',
      quantidade: json['quantidade'] ?? '',
      calorias: json['calorias'] ?? '',
    );
  }
}
