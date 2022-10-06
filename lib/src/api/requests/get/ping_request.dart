import '../../query_params/format_query_param.dart';
import '../../query_params/lang_query_param.dart';
import '../get_joke_api_request.dart';

class PingRequest extends GetJokeApiRequest {
  PingRequest({
    FormatQueryParam? format,
    LangQueryParam? lang,
  }) : super(
          'ping',
          queryParameters: [
            if (format != null) format,
            if (lang != null) lang,
          ],
        );
}
