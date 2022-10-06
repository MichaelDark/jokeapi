import 'dart:convert';

import 'package:jokeapi/jokeapi.dart';

void main() async {
  final apiClient = JokeApiClient();

  final jokeSingle = await fetchJoke(apiClient, JokeType.single);
  final jokeTwoPart = await fetchJoke(apiClient, JokeType.twopart);

  print(jokeSingle.toString());
  print(jokeTwoPart.toString());
}

Future<Joke> fetchJoke(JokeApiClient client, JokeType type) async {
  final response = await client.makeRequest(
    JokeRequest(type: JokeTypeQueryParam(type)),
  );
  final map = json.decode(response.body);
  return Joke.fromJson(map);
}
