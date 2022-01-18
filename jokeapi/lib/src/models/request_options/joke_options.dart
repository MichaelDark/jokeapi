import '../enums.dart';
import 'options.dart';

class JokeOptions implements RequestOptions {
  final List<JokeCategory> categories;
  final JokeFormat? format;
  final JokeType? type;
  final List<JokeBlacklistFlag>? blacklistFlags;
  final String? lang;
  final int? amount;
  final JokeIdRange? idRange;
  final String? contains;
  final bool safeMode;

  JokeOptions(
    this.categories, {
    this.format,
    this.type,
    this.blacklistFlags,
    this.lang,
    this.amount,
    this.idRange,
    this.contains,
    this.safeMode = false,
  });

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
      if (safeMode) 'safeMode': null,
      if (format != null) 'format': format!.name,
      if (lang != null) 'lang': lang,
      if (type != null) 'type': type!.name,
      if (amount != null) 'amount': '$amount',
      if (idRange != null) 'idRange': idRange!.toQuery(),
      if (contains != null) 'contains': contains,
      if (blacklistFlags != null)
        'blacklistFlags': blacklistFlags!.map((b) => b.name).join(','),
    };
  }
}
