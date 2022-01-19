// TODO(mike): Add enums parsing
import 'joke_flags.dart';

class TwoPartJoke {
  final bool? error;
  final String? category;
  final String? type;
  final String? setup;
  final String? delivery;
  final JokeFlags? flags;
  final int? id;
  final bool? safe;
  final String? lang;

  TwoPartJoke({
    this.error,
    this.category,
    this.type,
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
        type = json['type'],
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
    data['type'] = type;
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
}
