// ignore_for_file: public_member_api_docs

import 'package:json_annotation/json_annotation.dart';

part 'info_response.g.dart';

@JsonSerializable(createToJson: false)
final class InfoResponse {
  final bool error;
  final String version;
  final Jokes jokes;
  final List<String> formats;
  final int jokeLanguages;
  final int systemLanguages;
  final String info;
  final int timestamp;

  const InfoResponse({
    required this.error,
    required this.version,
    required this.jokes,
    required this.formats,
    required this.jokeLanguages,
    required this.systemLanguages,
    required this.info,
    required this.timestamp,
  });

  factory InfoResponse.fromJson(Map<String, dynamic> json) =>
      _$InfoResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
final class Jokes {
  final int totalCount;
  final List<String> categories;
  final List<String> flags;
  final List<String> types;
  final String submissionURL;
  final Map<String, List<int>> idRange;
  final List<SafeJoke> safeJokes;

  Jokes({
    required this.totalCount,
    required this.categories,
    required this.flags,
    required this.types,
    required this.submissionURL,
    required this.idRange,
    required this.safeJokes,
  });

  factory Jokes.fromJson(Map<String, dynamic> json) => _$JokesFromJson(json);
}

@JsonSerializable(createToJson: false)
final class SafeJoke {
  final String lang;
  final int count;

  SafeJoke({
    required this.lang,
    required this.count,
  });

  factory SafeJoke.fromJson(Map<String, dynamic> json) =>
      _$SafeJokeFromJson(json);
}
