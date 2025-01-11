import 'dart:convert';

import 'package:calories_app_flutter/data/http/http_client.dart';
import 'package:calories_app_flutter/data/models/comida_model.dart';

abstract class IComidaRepository {
  Future getComida(String keyWord);
}

class ComidaRepository implements IComidaRepository {
  final IHttpClient client;

  ComidaRepository({required this.client});
  @override
  Future<List<ComidaModel>> getComida(String keyWord) async {
    final String url =
        'https://caloriasporalimentoapi.herokuapp.com/api/calorias/?descricao=$keyWord';

    final response = await client.get(url);
    if (response.statusCode == 200) {
      final decodedResponse = utf8.decode(response.bodyBytes);
      final data = jsonDecode(decodedResponse);
      return (data as List).map((json) => ComidaModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load comida');
    }
  }
}
