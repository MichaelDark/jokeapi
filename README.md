API wrapper for jokeapi.dev

## Features

- `RawJokeClient`, that performs raw requests to the JokeAPI.

## Usage

To execute requests and get raw responses, use `RawJokeClient`:

```dart
const jokeClient = RawJokeClient();
jokeClient.getJoke(JokeOptions([JokeCategory.any]));
```
