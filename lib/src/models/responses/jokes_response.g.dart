// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jokes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JokesResponse _$JokesResponseFromJson(Map<String, dynamic> json) =>
    JokesResponse(
      error: json['error'] as bool,
      jokes: const JokeListJsonConverter()
          .fromJson(_readWholeJson(json, 'joke') as Map),
    );

Flags _$FlagsFromJson(Map<String, dynamic> json) => Flags(
      nsfw: json['nsfw'] as bool,
      religious: json['religious'] as bool,
      political: json['political'] as bool,
      racist: json['racist'] as bool,
      sexist: json['sexist'] as bool,
      explicit: json['explicit'] as bool,
    );

SingleJoke _$SingleJokeFromJson(Map<String, dynamic> json) => SingleJoke(
      joke: json['joke'] as String,
      category: json['category'] as String,
      type: json['type'] as String,
      flags: Flags.fromJson(json['flags'] as Map<String, dynamic>),
      id: (json['id'] as num).toInt(),
      safe: json['safe'] as bool,
      lang: json['lang'] as String,
    );

TwoPartJoke _$TwoPartJokeFromJson(Map<String, dynamic> json) => TwoPartJoke(
      setup: json['setup'] as String,
      delivery: json['delivery'] as String,
      category: json['category'] as String,
      type: json['type'] as String,
      flags: Flags.fromJson(json['flags'] as Map<String, dynamic>),
      id: (json['id'] as num).toInt(),
      safe: json['safe'] as bool,
      lang: json['lang'] as String,
    );
