// TODO(mike): Add enums parsing
class JokeApiError {
  final bool? error;
  final bool? internalError;
  final int? code;
  final String? message;
  final List<String>? causedBy;
  final String? additionalInfo;
  final int? timestamp;

  JokeApiError({
    this.error,
    this.internalError,
    this.code,
    this.message,
    this.causedBy,
    this.additionalInfo,
    this.timestamp,
  });

  JokeApiError.fromJson(Map<String, dynamic> json)
      : error = json['error'],
        internalError = json['internalError'],
        code = json['code'],
        message = json['message'],
        causedBy = json['causedBy'].cast<String>(),
        additionalInfo = json['additionalInfo'],
        timestamp = json['timestamp'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['internalError'] = internalError;
    data['code'] = code;
    data['message'] = message;
    data['causedBy'] = causedBy;
    data['additionalInfo'] = additionalInfo;
    data['timestamp'] = timestamp;
    return data;
  }
}
