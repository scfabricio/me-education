import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class ApiClient {
  Future get(String url);
  Future post(String url, Map<String, dynamic> body);
  void dispose();
}

@LazySingleton(as: ApiClient)
class HttpApiClient implements ApiClient {
  final _baseUrl = 'http://10.0.2.2:3300';
  final _client = http.Client();

  @override
  Future get(String url) {
    return _client.get(Uri.parse(_baseUrl + url));
  }

  @override
  Future post(String url, Map<String, dynamic> body) {
    return _client.post(
      Uri.parse(_baseUrl + url), 
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body)
    );
  }

  @override
  @disposeMethod
  dispose() {
    _client.close();
  }
}