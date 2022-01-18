import 'package:jokeapi/jokeapi.dart';
import 'package:test/test.dart';

// TODO(mike): Add tests
void main() {
  group('RawJokeClient', () {
    final client = RawJokeClient();

    test(
      'Get Joke',
      () async {
        final response = await client.getJoke(
          JokeOptions([JokeCategory.any]),
        );
        print(response.body);
      },
      skip: true,
    );

    test(
      'Get Info',
      () async {
        final response = await client.getInfo();
        print(response.body);
      },
      skip: true,
    );

    test(
      'Get Categories',
      () async {
        final response = await client.getCategories();
        print(response.body);
      },
      skip: true,
    );

    test(
      'Get Langcode',
      () async {
        final response = await client.getLangCode(
          LangCodeOptions('sw3d1sh'),
        );
        print(response.body);
      },
      skip: true,
    );

    test(
      'Get Languages',
      () async {
        final response = await client.getLanguages();
        print(response.body);
      },
      skip: true,
    );

    test(
      'Get Flags',
      () async {
        final response = await client.getFlags();
        print(response.body);
      },
      skip: true,
    );

    test(
      'Get Formats',
      () async {
        final response = await client.getFormats();
        print(response.body);
      },
      skip: true,
    );

    test(
      'Ping!',
      () async {
        final response = await client.ping();
        print(response.body);
      },
      skip: true,
    );

    test(
      'Get Endpoints',
      () async {
        final response = await client.getEndpoints();
        print(response.body);
      },
      skip: true,
    );
  });
}