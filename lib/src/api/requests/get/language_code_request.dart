import '../../path_params/language_path_param.dart';
import '../../query_params/format_query_param.dart';
import '../../query_params/lang_query_param.dart';
import '../get_joke_api_request.dart';

class LanguageCodeRequest extends GetJokeApiRequest {
  LanguageCodeRequest(
    String language, {
    FormatQueryParam? format,
    LangQueryParam? lang,
  }) : super(
          'langcode',
          pathParameter: LanguagePathParam(language),
          queryParameters: [
            if (format != null) format,
            if (lang != null) lang,
          ],
        );
}
