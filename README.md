# 😂 jokeapi 😂

## ⚠ Note: due to the different types of humor, JokeAPI contains a wide variety of jokes, of which some are very offensive. They can be filtered out using the blacklistFlags or safe-mode parameters, but use this API at your own risk!

Dart client for [JokeAPI](https://jokeapi.dev/).

[![jokeapi](https://img.shields.io/pub/v/jokeapi?label=jokeapi)](https://pub.dev/packages/jokeapi)
[![Uptime / 7 Days](https://img.shields.io/uptimerobot/ratio/7/m784261094-bff76b959ebb8fc39f7eb2d0)](https://status.sv443.net/)  

Get various jokes from [JokeAPI](https://jokeapi.dev/) without any API token, membership, registration or payment.

## Usage

```dart
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

```

## Planned Features

- [ ] Error handling
- [ ] Automate API generation
- [x] Supported endpoints
  - [x] `v2.jokeapi.dev/joke/[Category/-ies]`
  - [x] `v2.jokeapi.dev/info`
  - [ ] `v2.jokeapi.dev/categories`
  - [ ] `v2.jokeapi.dev/langcode/[Language]`
  - [ ] `v2.jokeapi.dev/languages`
  - [ ] `v2.jokeapi.dev/flags`
  - [ ] `v2.jokeapi.dev/formats`
  - [ ] `v2.jokeapi.dev/ping`
  - [ ] `v2.jokeapi.dev/endpoints`
  - [ ] `v2.jokeapi.dev/submit`

## Support

<a href="https://www.buymeacoffee.com/michaeldark" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>