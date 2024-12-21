import 'dart:convert';

import 'package:jokeapi/src/models/responses/jokes_response.dart';
import 'package:test/test.dart';

void main() {
  group('JokesResponse', () {
    test('should parse single joke', () {
      final jsonText = """
{
    "error": false,
    "category": "Programming",
    "type": "single",
    "joke": "Have a great weekend!\\nI hope your code behaves the same on Monday as it did on Friday.",
    "flags": {
        "nsfw": false,
        "religious": false,
        "political": false,
        "racist": false,
        "sexist": false,
        "explicit": false
    },
    "id": 44,
    "safe": true,
    "lang": "en"
}
""";
      final response = JokesResponse.fromJson(json.decode(jsonText));
      expect(response.jokes, hasLength(1));
      Joke joke = response.jokes.first;
      expect(joke, isA<SingleJoke>());
      joke = joke as SingleJoke;
      expect(
        joke.joke,
        "Have a great weekend!\nI hope your code behaves the same on Monday as it did on Friday.",
      );
    });

    test('should parse two part joke', () {
      final jsonText = """
{
    "error": false,
    "category": "Programming",
    "type": "twopart",
    "setup": "What is the best prefix for global variables?",
    "delivery": "//",
    "flags": {
        "nsfw": false,
        "religious": false,
        "political": false,
        "racist": false,
        "sexist": false,
        "explicit": false
    },
    "id": 32,
    "safe": true,
    "lang": "en"
}
""";
      final response = JokesResponse.fromJson(json.decode(jsonText));
      expect(response.jokes, hasLength(1));
      Joke joke = response.jokes.first;
      expect(joke, isA<TwoPartJoke>());
      joke = joke as TwoPartJoke;
      expect(joke.setup, "What is the best prefix for global variables?");
      expect(joke.delivery, "//");
    });

    test('should parse two jokes', () {
      final jsonText = """
{
    "error": false,
    "amount": 2,
    "jokes": [
        {
            "category": "Programming",
            "type": "single",
            "joke": "Have a great weekend!\\nI hope your code behaves the same on Monday as it did on Friday.",
            "flags": {
                "nsfw": false,
                "religious": false,
                "political": false,
                "racist": false,
                "sexist": false,
                "explicit": false
            },
            "id": 44,
            "safe": true,
            "lang": "en"
        },
        {
            "error": false,
            "category": "Programming",
            "type": "twopart",
            "setup": "What is the best prefix for global variables?",
            "delivery": "//",
            "flags": {
                "nsfw": false,
                "religious": false,
                "political": false,
                "racist": false,
                "sexist": false,
                "explicit": false
            },
            "id": 32,
            "safe": true,
            "lang": "en"
        }
    ]
}
""";
      final response = JokesResponse.fromJson(json.decode(jsonText));
      expect(response.jokes, hasLength(2));

      Joke joke1 = response.jokes.first;
      expect(joke1, isA<SingleJoke>());
      joke1 = joke1 as SingleJoke;
      expect(
        joke1.joke,
        "Have a great weekend!\nI hope your code behaves the same on Monday as it did on Friday.",
      );

      Joke joke2 = response.jokes.last;
      expect(joke2, isA<TwoPartJoke>());
      joke2 = joke2 as TwoPartJoke;
      expect(joke2.setup, "What is the best prefix for global variables?");
      expect(joke2.delivery, "//");
    });
  });
}
