import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

abstract class MockResponse {
  static Future<String> loadJson(String filename) {
    final file = File('test/mocks/json/$filename');
    return file.readAsString();
  }

  static Future<String> singleJoke() => loadJson('single_joke_response.json');
  static Future<String> twoPartJoke() =>
      loadJson('two_part_joke_response.json');
  static Future<String> info() => loadJson('info_response.json');
  static Future<String> categories() => loadJson('categories_response.json');
  static Future<String> langcode() => loadJson('langcode_response.json');
  static Future<String> languages() => loadJson('languages_response.json');
  static Future<String> flags() => loadJson('flags_response.json');
  static Future<String> formats() => loadJson('formats_response.json');
  static Future<String> ping() => loadJson('ping_response.json');
  static Future<String> endpoints() => loadJson('endpoints_response.json');
}

http.Client createMockClient() {
  Future<http.Response> handleHttpRequest(http.Request request) async {
    switch (request.url.path) {
      case '/joke/Any':
        switch (request.url.queryParameters['type']) {
          case 'single':
            return http.Response(await MockResponse.singleJoke(), 200);
          case 'twopart':
            return http.Response(await MockResponse.twoPartJoke(), 200);
        }
        break;
      case '/info':
        return http.Response(await MockResponse.info(), 200);
      case '/categories':
        return http.Response(await MockResponse.categories(), 200);
      case '/langcode/sw3d1sh':
        return http.Response(await MockResponse.langcode(), 200);
      case '/languages':
        return http.Response(await MockResponse.languages(), 200);
      case '/flags':
        return http.Response(await MockResponse.flags(), 200);
      case '/formats':
        return http.Response(await MockResponse.formats(), 200);
      case '/ping':
        return http.Response(await MockResponse.ping(), 200);
      case '/endpoints':
        return http.Response(await MockResponse.endpoints(), 200);
    }

    return http.Response('Error!', 500);
  }

  final mockClient = MockClient(handleHttpRequest);
  return mockClient;
}
