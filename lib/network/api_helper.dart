// import 'dart:convert';
// import 'package:http/http.dart' as mHttp;
// import 'package:pretty_http_logger/pretty_http_logger.dart';
//
// enum HttpType { GET, POST, DELETE }
//
// String baseUrl = "https://dummyapi.online/api";
//
// class ApiHelper {
//   static final ApiHelper _instance = ApiHelper._internal();
//
//   factory ApiHelper() {
//     return _instance;
//   }
//
//   ApiHelper._internal() {}
//
//   Future<dynamic> apiRequest(
//       {required String url,
//         Map? body,
//         HttpType httpType = HttpType.GET}) async {
//
//     try {
//
//       HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
//         HttpLogger(logLevel: LogLevel.BODY),
//       ]);
//
//       final Uri uri = Uri.parse(baseUrl + url);
//       mHttp.Response response;
//
//       switch (httpType) {
//         case HttpType.GET:
//           response = await http.get(uri);
//           break;
//         case HttpType.POST:
//           response = await http.post(uri, body: jsonEncode(body));
//           break;
//         case HttpType.DELETE:
//           response = await http.delete(uri, body: jsonEncode(body));
//           break;
//       }
//
//       final result = jsonDecode(response.body);
//       print(result);
//       return result;
//     }catch(e){
//       print(e);
//     }
//
//   }
// }
