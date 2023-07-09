import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pretty_http_logger/pretty_http_logger.dart';

String _baseUrl = 'https://jsonplaceholder.typicode.com/';


enum HttpType {get, post, delete}

class ApiHelper {
  static final ApiHelper _instance = ApiHelper._internal();

  static final HttpWithMiddleware _httpClient =
      HttpWithMiddleware.build(middlewares: [
    HttpLogger(logLevel: LogLevel.BODY),
  ]);


  static Map<String, String> _header = {
    "" : "",
  };

  factory ApiHelper() {
    return _instance;
  }

  ApiHelper._internal() {}

  Future<dynamic> apiRequest(
      {required String url, Map? body, HttpType type = HttpType.get, Map<String, String>? header}) async {
    final Uri uri = Uri.parse(_baseUrl + url);
    http.Response response;
    switch (type) {
      case HttpType.get:
        response = await _httpClient.get(uri, headers: header ?? _header);
        break;
      case HttpType.post:
        response = await _httpClient.post(uri, body: jsonEncode(body), headers: header ?? _header);
        break;
      case HttpType.delete:
        response = await _httpClient.delete(uri, body: jsonEncode(body), headers: header ?? _header);
        break;
    }
    return handelRequest(response);
  }

  handelRequest(http.Response res) {
    if (res.statusCode >= 200 && res.statusCode < 300) {
      return jsonDecode(res.body);
    } else if (res.statusCode == 401) {
      // TODO: navigate to login screen
      return null;
    } else {
      // TODO: show error message
      return null;
    }
  }
}
