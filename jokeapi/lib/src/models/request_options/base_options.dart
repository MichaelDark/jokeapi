import '../enums.dart';
import 'options.dart';

class LangCodeOptions extends FormatLangOptions {
  final String language;

  LangCodeOptions(
    this.language, {
    JokeFormat? format,
    String? lang,
  }) : super(format: format, lang: lang);

  @override
  List<String> get pathSegments => [language];
}

class FormatLangOptions extends FormatOptions {
  final String? lang;

  FormatLangOptions({
    JokeFormat? format,
    this.lang,
  }) : super(format: format);

  @override
  List<String> get pathSegments => [];

  @override
  Map<String, dynamic> get queryParameters {
    return {
      if (format != null) 'format': format!.name,
      if (lang != null) 'lang': lang,
    };
  }
}

class FormatOptions implements RequestOptions {
  final JokeFormat? format;

  FormatOptions({this.format});

  @override
  List<String> get pathSegments => [];

  @override
  Map<String, dynamic> get queryParameters {
    return {if (format != null) 'format': format!.name};
  }
}
