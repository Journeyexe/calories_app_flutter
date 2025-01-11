import 'package:calories_app_flutter/data/models/environment.dart';
import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future get(String url);
  Future getImage(String url);
}

class HttpClient implements IHttpClient {
  final client = http.Client();

  @override
  Future get(String url) async {
    return await client.get(
      Uri.parse(url),
    );
  }

  @override
  Future getImage(String url) async {
    final headers = {"Authorization": Environment.apiKey};
    return await client.get(Uri.parse(url), headers: headers);
  }
}
