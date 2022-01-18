// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JokeResponse _$JokeErrorFromJson(Map<String, dynamic> json) => JokeResponse(
      json['error'] as bool,
      json['internalError'] as bool,
      json['message'] as String,
      (json['causedBy'] as List<dynamic>).map((e) => e as String).toList(),
      json['additionalInfo'] as String,
      json['timestamp'] as int,
    );

Map<String, dynamic> _$JokeErrorToJson(JokeResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'internalError': instance.internalError,
      'message': instance.message,
      'causedBy': instance.causedBy,
      'additionalInfo': instance.additionalInfo,
      'timestamp': instance.timestamp,
    };
