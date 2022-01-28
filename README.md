<!-- This content is generated. See tool/readme/readme_template.md -->

[![Pub Package](https://img.shields.io/pub/v/jokeapi.svg)](https://pub.dev/packages/jokeapi)

API wrapper for jokeapi.dev

## Features

- `RawJokeApiClient`, that performs raw requests to the JokeAPI.
- `JokeApiClient`, that performs requests to the JokeAPI.

## Usage

To execute requests and get raw responses, use `RawJokeApiClient`:

```dart
final jokeClient = RawJokeApiClient();
final jokeResponse = await jokeClient.getJoke(JokeOptions([JokeCategory.any]));
```

To execute requests and get responses wrapped with built-in models, use `JokeApiClient`:

```dart
final jokeClient = JokeApiClient();
final joke = await getSingleJoke(SingleJokeOptions([JokeCategory.any]));
```
