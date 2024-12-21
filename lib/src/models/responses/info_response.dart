import 'package:json_annotation/json_annotation.dart';

part 'info_response.g.dart';

/// Response model.
@JsonSerializable(createToJson: false)
final class InfoResponse {
  /// If the response was erroneous.
  final bool error;

  /// API version.
  final String version;

  /// Jokes Information.
  final JokesInfo jokes;

  /// Response formats.
  final List<String> formats;

  /// Number of joke languages.
  final int jokeLanguages;

  /// Number of system languages.
  final int systemLanguages;

  /// General information.
  final String info;

  /// Timestamp.
  final int timestamp;

  /// Create response model.
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

  /// Create response model from JSON.
  factory InfoResponse.fromJson(Map<String, dynamic> json) =>
      _$InfoResponseFromJson(json);
}

/// Response model used in [InfoResponse].
@JsonSerializable(createToJson: false)
final class JokesInfo {
  /// Number of **safe** jokes available.
  final int totalCount;

  /// Categories.
  final List<String> categories;

  /// Blacklist Flags.
  final List<String> flags;

  /// Joke Types.
  final List<String> types;

  /// Joke Submission URL.
  final String submissionURL;

  /// ID Ranges by language code.
  final Map<String, List<int>> idRange;

  /// Number of safe jokes per language codes.
  final List<SafeJoke> safeJokes;

  /// Create response model.
  JokesInfo({
    required this.totalCount,
    required this.categories,
    required this.flags,
    required this.types,
    required this.submissionURL,
    required this.idRange,
    required this.safeJokes,
  });

  /// Create response model from JSON.
  factory JokesInfo.fromJson(Map<String, dynamic> json) =>
      _$JokesInfoFromJson(json);
}

/// Response model used in [InfoResponse].
@JsonSerializable(createToJson: false)
final class SafeJoke {
  /// Language code.
  final String lang;

  /// Count.
  final int count;

  /// Create response model.
  SafeJoke({
    required this.lang,
    required this.count,
  });

  /// Create response model from JSON.
  factory SafeJoke.fromJson(Map<String, dynamic> json) =>
      _$SafeJokeFromJson(json);
}
