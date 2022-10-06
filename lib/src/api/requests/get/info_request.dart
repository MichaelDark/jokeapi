import '../../query_params/format_query_param.dart';
import '../../query_params/lang_query_param.dart';
import '../get_joke_api_request.dart';

class InfoRequest extends GetJokeApiRequest {
  InfoRequest({
    FormatQueryParam? format,
    LangQueryParam? lang,
  }) : super(
          'info',
          queryParameters: [
            if (format != null) format,
            if (lang != null) lang,
          ],
        );
}
