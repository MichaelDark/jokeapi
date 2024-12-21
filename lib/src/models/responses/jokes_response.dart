// ignore_for_file: public_member_api_docs

import 'package:json_annotation/json_annotation.dart';

part 'jokes_response.g.dart';

dynamic _readWholeJson(map, _) => map;

@JsonSerializable(createToJson: false)
class JokesResponse {
  final bool error;

  @JsonKey(readValue: _readWholeJson)
  @JokeListJsonConverter()
  final List<Joke> jokes;

  JokesResponse({
    required this.error,
    required this.jokes,
  });

  factory JokesResponse.fromJson(Map<String, dynamic> json) =>
      _$JokesResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class Flags {
  final bool nsfw;
  final bool religious;
  final bool political;
  final bool racist;
  final bool sexist;
  final bool explicit;

  Flags({
    required this.nsfw,
    required this.religious,
    required this.political,
    required this.racist,
    required this.sexist,
    required this.explicit,
  });

  factory Flags.fromJson(Map<String, dynamic> json) => _$FlagsFromJson(json);
}

class JokeListJsonConverter extends JsonConverter<List<Joke>, Map> {
  const JokeListJsonConverter();

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

sealed class Joke {
  final String category;
  final String type;
  final Flags flags;
  final int id;
  final bool safe;
  final String lang;

  Joke({
    required this.category,
    required this.type,
    required this.flags,
    required this.id,
    required this.safe,
    required this.lang,
  });
}

@JsonSerializable(createToJson: false)
class SingleJoke extends Joke {
  final String joke;

  SingleJoke({
    required this.joke,
    required super.category,
    required super.type,
    required super.flags,
    required super.id,
    required super.safe,
    required super.lang,
  });

  factory SingleJoke.fromJson(Map<String, dynamic> json) =>
      _$SingleJokeFromJson(json);
}

@JsonSerializable(createToJson: false)
final class TwoPartJoke extends Joke {
  final String setup;
  final String delivery;

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

  factory TwoPartJoke.fromJson(Map<String, dynamic> json) =>
      _$TwoPartJokeFromJson(json);
}
