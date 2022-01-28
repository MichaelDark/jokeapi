<!-- This content is generated. See tool/readme/readme_template.md -->

[![Pub Package](https://img.shields.io/pub/v/jokeapi.svg)](https://pub.dev/packages/jokeapi)

API wrapper for jokeapi.dev

## Features

- `RawJokeClient`, that performs raw requests to the JokeAPI.

## Usage

To execute requests and get raw responses, use `RawJokeClient`:

```dart
const jokeClient = RawJokeClient();
jokeClient.getJoke(JokeOptions([JokeCategory.any]));
```
