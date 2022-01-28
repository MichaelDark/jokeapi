import 'dart:convert';

import 'package:jokeapi/jokeapi.dart';
import 'package:jokeapi/src/joke_api_client.dart';
import 'package:jokeapi/src/models/single_joke.dart';
import 'package:jokeapi/src/models/two_part_joke.dart';
import 'package:test/test.dart';

import 'mocks/mock_http_client.dart';

void main() {
  group('JokeApiClient', () {
    final mockClient = createMockClient();
    final rawClient = RawJokeApiClient(client: mockClient);
    final client = JokeApiClient(client: rawClient);

    Future<void> testCall<T>(
      Future<T> call,
      Future<String> expectedResponse,
      T Function(Map<String, dynamic>) mapper,
    ) async {
      final response = await call;

      print(response);

      final expectedJson = jsonDecode(await expectedResponse);
      expect(response, equals(mapper(expectedJson)));
    }

    test('getSingleJoke', () async {
      await testCall(
        client.getSingleJoke(SingleJokeOptions([JokeCategory.any])),
        MockResponse.singleJoke(),
        SingleJoke.fromJson,
      );
    });

    test('getTwoPartJoke', () async {
      await testCall(
        client.getTwoPartJoke(TwoPartJokeOptions([JokeCategory.any])),
        MockResponse.twoPartJoke(),
        TwoPartJoke.fromJson,
      );
    });
  });
}
