// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoResponse _$InfoResponseFromJson(Map<String, dynamic> json) => InfoResponse(
      error: json['error'] as bool,
      version: json['version'] as String,
      jokes: Jokes.fromJson(json['jokes'] as Map<String, dynamic>),
      formats:
          (json['formats'] as List<dynamic>).map((e) => e as String).toList(),
      jokeLanguages: (json['jokeLanguages'] as num).toInt(),
      systemLanguages: (json['systemLanguages'] as num).toInt(),
      info: json['info'] as String,
      timestamp: (json['timestamp'] as num).toInt(),
    );

Jokes _$JokesFromJson(Map<String, dynamic> json) => Jokes(
      totalCount: (json['totalCount'] as num).toInt(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      flags: (json['flags'] as List<dynamic>).map((e) => e as String).toList(),
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
      submissionURL: json['submissionURL'] as String,
      idRange: (json['idRange'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k, (e as List<dynamic>).map((e) => (e as num).toInt()).toList()),
      ),
      safeJokes: (json['safeJokes'] as List<dynamic>)
          .map((e) => SafeJoke.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

SafeJoke _$SafeJokeFromJson(Map<String, dynamic> json) => SafeJoke(
      lang: json['lang'] as String,
      count: (json['count'] as num).toInt(),
    );
