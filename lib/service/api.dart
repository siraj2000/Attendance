// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'dart:async';

// class Api {

//   Future<Response> get(url, Map body) async {
//     if (kDebugMode) {
//       print("GET ON $baseUrl$url");
//     }
//     Response response = await http.get(Uri.parse('$baseUrl$url'));
//     if (kDebugMode) {
//       print("STATUS CODE :${response.statusCode}");
//     }

//     if (kDebugMode) {
//       print("RESPONSE BODY :${response.body}");
//     }
//     return response;
//   }

//   Future<Response> post(url, Map body) async {
//     Response response = await http.post(Uri.parse('$baseUrl$url'), body: body);
//     return response;
//   }

//   Future<Response> put(url, Map body) async {
//     Response response = await http.put(Uri.parse('$baseUrl$url'), body: body);
//     return response;
//   }

//   delete(url, Map body) async {
//     Response response =
//         await http.delete(Uri.parse('$baseUrl$url'), body: body);
//     return response;
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Api {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<Response> get(String url) async {
    if (kDebugMode) {
      print("GET => $url");
    }
    final response = await _dio.get(url);
    return response;
  }
}
