import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/joke_error.dart';
import 'models/options.dart';
import 'models/single_joke.dart';
import 'models/two_part_joke.dart';
import 'raw_joke_api_client.dart';

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
