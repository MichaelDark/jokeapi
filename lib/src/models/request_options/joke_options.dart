import '../enums.dart';
import 'request_options.dart';

enum _JokeType { single, twopart }

class SingleJokeOptions extends _JokeOptions {
  SingleJokeOptions(
    List<JokeCategory> categories, {
    JokeFormat? format,
    List<JokeBlacklistFlag>? blacklistFlags,
    String? lang,
    JokeIdRange? idRange,
    String? contains,
    bool safeMode = false,
  }) : super(
          categories,
          format: format,
          blacklistFlags: blacklistFlags,
          lang: lang,
          amount: 1,
          idRange: idRange,
          contains: contains,
          safeMode: safeMode,
        );

  @override
  _JokeType get type => _JokeType.single;
}

class TwoPartJokeOptions extends _JokeOptions {
  TwoPartJokeOptions(
    List<JokeCategory> categories, {
    JokeFormat? format,
    List<JokeBlacklistFlag>? blacklistFlags,
    String? lang,
    JokeIdRange? idRange,
    String? contains,
    bool safeMode = false,
  }) : super(
          categories,
          format: format,
          blacklistFlags: blacklistFlags,
          lang: lang,
          amount: 1,
          idRange: idRange,
          contains: contains,
          safeMode: safeMode,
        );

  @override
  _JokeType get type => _JokeType.twopart;
}

abstract class _JokeOptions implements RequestOptions {
  final List<JokeCategory> categories;
  final JokeFormat? format;
  final List<JokeBlacklistFlag>? blacklistFlags;
  final String? lang;
  final int? amount;
  final JokeIdRange? idRange;
  final String? contains;
  final bool safeMode;

  _JokeOptions(
    this.categories, {
    this.format,
    this.blacklistFlags,
    this.lang,
    this.amount,
    this.idRange,
    this.contains,
    this.safeMode = false,
  });

  _JokeType get type;

  @override
  List<String> get pathSegments {
    return [
      categories.contains(JokeCategory.any)
          ? JokeCategory.any.toQuery()
          : categories.map(JokeCategoryExt.toQueryStatic).join(','),
    ];
  }

  @override
  Map<String, dynamic> get queryParameters {
    return {
      'type': type.name,
      if (safeMode) 'safeMode': null,
      if (format != null) 'format': format!.name,
      if (lang != null) 'lang': lang,
      if (amount != null) 'amount': '$amount',
      if (idRange != null) 'idRange': idRange!.toQuery(),
      if (contains != null) 'contains': contains,
      if (blacklistFlags != null)
        'blacklistFlags': blacklistFlags!.map((b) => b.name).join(','),
    };
  }
}
