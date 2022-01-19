import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/joke_error.dart';
import 'models/options.dart';
import 'models/single_joke.dart';
import 'models/two_part_joke.dart';
import 'raw_joke_api_client.dart';

// TODO(mike): Implement all endpoints
class JokeApiClient {
  final RawJokeApiClient client;

  JokeApiClient({RawJokeApiClient? client})
      : client = client ?? RawJokeApiClient();

  Future<SingleJoke> getSingleJoke(SingleJokeOptions options) async {
    return _makeCall(
      () => client.getSingleJoke(options),
      SingleJoke.fromJson,
    );
  }

  Future<TwoPartJoke> getTwoPartJoke(TwoPartJokeOptions options) async {
    return _makeCall(
      () => client.getTwoPartJoke(options),
      TwoPartJoke.fromJson,
    );
  }

  // Future<http.Response> getTwoPartJoke(TwoPartJokeOptions options) async {
  //   return _makeCall("joke", options);
  // }

  // Future<http.Response> getInfo([FormatLangOptions? options]) async {
  //   return _makeCall("info", options);
  // }

  // Future<http.Response> getCategories([FormatLangOptions? options]) async {
  //   return _makeCall("categories", options);
  // }

  // Future<http.Response> getLangCode(LangCodeOptions options) async {
  //   return _makeCall("langcode", options);
  // }

  // Future<http.Response> getLanguages([FormatLangOptions? options]) async {
  //   return _makeCall("languages", options);
  // }

  // Future<http.Response> getFlags([FormatLangOptions? options]) async {
  //   return _makeCall("flags", options);
  // }

  // Future<http.Response> getFormats([FormatLangOptions? options]) async {
  //   return _makeCall("formats", options);
  // }

  // Future<http.Response> ping([FormatLangOptions? options]) async {
  //   return _makeCall("ping", options);
  // }

  // Future<http.Response> getEndpoints([FormatOptions? options]) async {
  //   return _makeCall("endpoints", options);
  // }

  Future<T> _makeCall<T>(
    Future<http.Response> Function() apiCall,
    T Function(Map<String, dynamic> parse) parser,
  ) async {
    final response = await apiCall();
    if (response.statusCode / 100 != 2) {
      final json = jsonDecode(response.body);
      return Future.error(JokeApiError.fromJson(json));
    }
    final json = jsonDecode(response.body);
    return parser(json);
  }
}
