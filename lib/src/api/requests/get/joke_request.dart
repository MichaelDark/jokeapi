import '../../path_params/joke_path_param.dart';
import '../../query_params/amount_query_param.dart';
import '../../query_params/blacklist_flags_query_param.dart';
import '../../query_params/contains_query_param.dart';
import '../../query_params/format_query_param.dart';
import '../../query_params/id_range_query_param.dart';
import '../../query_params/joke_type_query_param.dart';
import '../../query_params/lang_query_param.dart';
import '../get_joke_api_request.dart';

class JokeRequest extends GetJokeApiRequest {
  JokeRequest({
    JokePathParam pathParameter = const JokePathParam(),
    FormatQueryParam? format,
    BlacklistFlagsQueryParam? blacklistFlags,
    LangQueryParam? lang,
    IdRangeQueryParam? idRange,
    ContainsQueryParam? contains,
    JokeTypeQueryParam? type,
    AmountQueryParam? amount,
  }) : super(
          'joke',
          pathParameter: pathParameter,
          queryParameters: [
            if (format != null) format,
            if (blacklistFlags != null) blacklistFlags,
            if (lang != null) lang,
            if (idRange != null) idRange,
            if (contains != null) contains,
            if (type != null) type,
            if (amount != null) amount,
          ],
        );
}
