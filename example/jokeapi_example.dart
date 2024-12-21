import 'package:jokeapi/jokeapi.dart';

void main() async {
  final jokeApi = JokeApi();

  final jokes = [
    ...(await jokeApi.getJokes(type: JokeType.single)).jokes,
    ...(await jokeApi.getJokes(type: JokeType.twoPart)).jokes,
    ...(await jokeApi.getJokes(amount: 10)).jokes,
  ];

  for (final joke in jokes) {
    switch (joke) {
      case SingleJoke():
        print(joke.joke);
      case TwoPartJoke():
        print(joke.setup);
        print(joke.delivery);
    }
  }
}
