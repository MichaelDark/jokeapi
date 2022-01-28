// TODO(mike): Add enums parsing
import 'joke_flags.dart';

class SingleJoke {
  final bool? error;
  final String? category;
  final String? joke;
  final JokeFlags? flags;
  final int? id;
  final bool? safe;
  final String? lang;

  SingleJoke({
    this.error,
    this.category,
    this.joke,
    this.flags,
    this.id,
    this.safe,
    this.lang,
  });

  SingleJoke.fromJson(Map<String, dynamic> json)
      : error = json['error'],
        category = json['category'],
        joke = json['joke'],
        flags =
            json['flags'] != null ? JokeFlags.fromJson(json['flags']) : null,
        id = json['id'],
        safe = json['safe'],
        lang = json['lang'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['category'] = category;
    data['joke'] = joke;
    if (flags != null) {
      data['flags'] = flags!.toJson();
    }
    data['id'] = id;
    data['safe'] = safe;
    data['lang'] = lang;
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SingleJoke &&
        other.error == error &&
        other.category == category &&
        other.joke == joke &&
        other.flags == flags &&
        other.id == id &&
        other.safe == safe &&
        other.lang == lang;
  }

  @override
  int get hashCode {
    return error.hashCode ^
        category.hashCode ^
        joke.hashCode ^
        flags.hashCode ^
        id.hashCode ^
        safe.hashCode ^
        lang.hashCode;
  }
}
