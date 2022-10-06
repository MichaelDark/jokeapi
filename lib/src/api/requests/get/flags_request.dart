import '../../query_params/format_query_param.dart';
import '../../query_params/lang_query_param.dart';
import '../get_joke_api_request.dart';

class FlagsRequest extends GetJokeApiRequest {
  FlagsRequest({
    FormatQueryParam? format,
    LangQueryParam? lang,
  }) : super(
          'flags',
          queryParameters: [
            if (format != null) format,
            if (lang != null) lang,
          ],
        );
}
