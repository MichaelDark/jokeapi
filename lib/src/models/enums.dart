import 'package:recase/recase.dart';

enum JokeCategory { any, misc, programming, dark, pun, spooky, christmas }

extension JokeCategoryExt on JokeCategory {
  static String toQueryStatic(JokeCategory c) => c.name.pascalCase;
  String toQuery() => name.pascalCase;
}

enum JokeFormat { json, xml, yaml, txt }

enum JokeBlacklistFlag { nsfw, religious, political, racist, sexist, explicit }

// TODO(mike): Add validation on this parameters
const supportedSystemLanguages = {'cs', 'de', 'en', 'it', 'ru'};
const supportedLanguages = {'cs', 'de', 'en', 'es', 'fr', 'pt'};

class JokeIdRange {
  final int from;
  final int? to;

  JokeIdRange(this.from, [this.to]) : assert(to == null || from > to);

  String toQuery() {
    return to == null ? '$from' : '$from-$to';
  }
}

enum JokeType { single, twopart }
