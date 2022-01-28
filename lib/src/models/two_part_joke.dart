// TODO(mike): Add enums parsing
import 'joke_flags.dart';

class TwoPartJoke {
  final bool? error;
  final String? category;
  final String? setup;
  final String? delivery;
  final JokeFlags? flags;
  final int? id;
  final bool? safe;
  final String? lang;

  TwoPartJoke({
    this.error,
    this.category,
    this.setup,
    this.delivery,
    this.flags,
    this.id,
    this.safe,
    this.lang,
  });

  TwoPartJoke.fromJson(Map<String, dynamic> json)
      : error = json['error'],
        category = json['category'],
        setup = json['setup'],
        delivery = json['delivery'],
        flags =
            json['flags'] != null ? JokeFlags.fromJson(json['flags']) : null,
        id = json['id'],
        safe = json['safe'],
        lang = json['lang'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['category'] = category;
    data['setup'] = setup;
    data['delivery'] = delivery;
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

    return other is TwoPartJoke &&
        other.error == error &&
        other.category == category &&
        other.setup == setup &&
        other.delivery == delivery &&
        other.flags == flags &&
        other.id == id &&
        other.safe == safe &&
        other.lang == lang;
  }

  @override
  int get hashCode {
    return error.hashCode ^
        category.hashCode ^
        setup.hashCode ^
        delivery.hashCode ^
        flags.hashCode ^
        id.hashCode ^
        safe.hashCode ^
        lang.hashCode;
  }
}
