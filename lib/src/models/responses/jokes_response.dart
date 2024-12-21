import 'package:json_annotation/json_annotation.dart';

part 'jokes_response.g.dart';

dynamic _readWholeJson(map, _) => map;

/// Response model.
@JsonSerializable(createToJson: false)
class JokesResponse {
  /// If the response was erroneous.
  final bool error;

  @JsonKey(readValue: _readWholeJson)
  @JokeListJsonConverter._()

  /// List of jokes.
  ///
  /// Always contains at least 1 joke.
  final List<Joke> jokes;

  /// Create response model.
  JokesResponse({
    required this.error,
    required this.jokes,
  });

  /// Create response model from JSON.
  factory JokesResponse.fromJson(Map<String, dynamic> json) =>
      _$JokesResponseFromJson(json);
}

/// Response model used in [JokesResponse].
@JsonSerializable(createToJson: false)
class JokeFlags {
  /// If NSFW.
  final bool nsfw;

  /// If religious.
  final bool religious;

  /// If political.
  final bool political;

  /// If racist.
  final bool racist;

  /// If sexist.
  final bool sexist;

  /// If explicit.
  final bool explicit;

  /// Create response model.
  JokeFlags({
    required this.nsfw,
    required this.religious,
    required this.political,
    required this.racist,
    required this.sexist,
    required this.explicit,
  });

  /// Create response model from JSON.
  factory JokeFlags.fromJson(Map<String, dynamic> json) =>
      _$JokeFlagsFromJson(json);
}

/// Response model used in [JokesResponse].
class JokeListJsonConverter extends JsonConverter<List<Joke>, Map> {
  const JokeListJsonConverter._();

  @override
  List<Joke> fromJson(Map json) {
    if (json.containsKey('jokes')) {
      return (json['jokes'] as List)
          .cast<Map>()
          .map(fromJson)
          .expand((list) => list)
          .toList();
    }
    if (json.containsKey('joke')) {
      return [SingleJoke.fromJson(json.cast<String, dynamic>())];
    }
    if (json.containsKey('setup') && json.containsKey('delivery')) {
      return [TwoPartJoke.fromJson(json.cast<String, dynamic>())];
    }

    throw UnsupportedError("Cannot parse Joke from JSON");
  }

  @override
  Map toJson(List<Joke> object) => throw UnimplementedError();
}

/// Response model used in [JokesResponse].
sealed class Joke {
  /// Joke ID.
  final int id;

  /// Joke type.
  final String type;

  /// Joke category.
  final String category;

  /// Joke flags.
  final JokeFlags flags;

  /// Joke language code.
  final String lang;

  /// If the joke is safe.
  final bool safe;

  Joke({
    required this.id,
    required this.type,
    required this.category,
    required this.flags,
    required this.lang,
    required this.safe,
  });
}

/// Response model used in [JokesResponse].
@JsonSerializable(createToJson: false)
class SingleJoke extends Joke {
  /// Joke.
  final String joke;

  /// Create response model.
  SingleJoke({
    required this.joke,
    required super.category,
    required super.type,
    required super.flags,
    required super.id,
    required super.safe,
    required super.lang,
  });

  /// Create response model from JSON.
  factory SingleJoke.fromJson(Map<String, dynamic> json) =>
      _$SingleJokeFromJson(json);
}

/// Response model used in [JokesResponse].
@JsonSerializable(createToJson: false)
final class TwoPartJoke extends Joke {
  /// Joke setup.
  final String setup;

  /// Joke delivery/punchline
  final String delivery;

  /// Create response model.
  TwoPartJoke({
    required this.setup,
    required this.delivery,
    required super.category,
    required super.type,
    required super.flags,
    required super.id,
    required super.safe,
    required super.lang,
  });

  /// Create response model from JSON.
  factory TwoPartJoke.fromJson(Map<String, dynamic> json) =>
      _$TwoPartJokeFromJson(json);
}
