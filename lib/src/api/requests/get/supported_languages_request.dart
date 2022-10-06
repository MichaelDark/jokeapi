import '../../query_params/format_query_param.dart';
import '../../query_params/lang_query_param.dart';
import '../get_joke_api_request.dart';

class SupportedLanguagesRequest extends GetJokeApiRequest {
  SupportedLanguagesRequest({
    FormatQueryParam? format,
    LangQueryParam? lang,
  }) : super(
          'languages',
          queryParameters: [
            if (format != null) format,
            if (lang != null) lang,
          ],
        );
}
