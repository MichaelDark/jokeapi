import '../../query_params/format_query_param.dart';
import '../get_joke_api_request.dart';

class EndpointsRequest extends GetJokeApiRequest {
  EndpointsRequest({
    FormatQueryParam? format,
  }) : super(
          'endpoints',
          queryParameters: [
            if (format != null) format,
          ],
        );
}
