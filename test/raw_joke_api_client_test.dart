import 'package:http/http.dart';
import 'package:jokeapi/jokeapi.dart';
import 'package:test/test.dart';

import 'mocks/mock_http_client.dart';

void main() {
  group('RawJokeApiClient', () {
    final mockClient = createMockClient();
    final client = RawJokeApiClient(client: mockClient);

    Future<void> testCall(
      Future<Response> call,
      Future<String> expectedResponse,
    ) async {
      final response = await call;

      print(response.body);

      expect(response.body, await expectedResponse);
      expect(response.statusCode, 200);
    }

    test('getSingleJoke', () async {
      await testCall(
        client.getSingleJoke(SingleJokeOptions([JokeCategory.any])),
        MockResponse.singleJoke(),
      );
    });

    test('getTwoPartJoke', () async {
      await testCall(
        client.getTwoPartJoke(TwoPartJokeOptions([JokeCategory.any])),
        MockResponse.twoPartJoke(),
      );
    });

    test('getInfo', () async {
      await testCall(client.getInfo(), MockResponse.info());
    });

    test('getCategories', () async {
      await testCall(client.getCategories(), MockResponse.categories());
    });

    test('getLangCode', () async {
      await testCall(
        client.getLangCode(LangCodeOptions('sw3d1sh')),
        MockResponse.langcode(),
      );
    });

    test('getLanguages', () async {
      await testCall(client.getLanguages(), MockResponse.languages());
    });

    test('getFlags', () async {
      await testCall(client.getFlags(), MockResponse.flags());
    });

    test('getFormats', () async {
      await testCall(client.getFormats(), MockResponse.formats());
    });

    test('ping', () async {
      await testCall(client.ping(), MockResponse.ping());
    });

    test('getEndpoints', () async {
      await testCall(client.getEndpoints(), MockResponse.endpoints());
    });
  });
}
