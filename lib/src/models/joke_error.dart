import 'package:json_annotation/json_annotation.dart';

part 'joke_error.g.dart';

@JsonSerializable()
class JokeResponse {
  final bool error;
  final bool internalError;
  final String message;
  final List<String> causedBy;
  final String additionalInfo;
  final int timestamp;

  JokeResponse(
    this.error,
    this.internalError,
    this.message,
    this.causedBy,
    this.additionalInfo,
    this.timestamp,
  );

  factory JokeResponse.fromJson(Map<String, dynamic> json) =>
      _$JokeErrorFromJson(json);

  Map<String, dynamic> toJson() => _$JokeErrorToJson(this);
}
