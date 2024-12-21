part of 'joke_api.dart';

final class _JokeApi implements JokeApi {
  final http.Client _client;

  _JokeApi({http.Client? client}) : _client = client ?? http.Client();

  @override
  Future<JokesResponse> getJokes({
    List<JokeCategory> categories = const [JokeCategory.any],
    List<JokeFlag>? blacklistFlags,
    String? lang,
    ({int from, int? to})? idRange,
    String? contains,
    JokeType? type,
    int? amount,
    bool safeMode = true,
  }) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: 'v2.jokeapi.dev',
      path: p.join(
        'joke',
        (categories.isEmpty ? [JokeCategory.any] : categories)
            .map((category) => category.code)
            .join(','),
      ),
      queryParameters: {
        if (blacklistFlags case var flags? when flags.isNotEmpty) ...{
          'blacklistFlags': flags.map((flag) => flag.code),
        },
        if (idRange case (:int from, to: null)) ...{
          'idRange': '$from',
        } else if (idRange case (:int from, :int to) when from < to) ...{
          'idRange': '$from-$to',
        },
        if (contains case var query? when query.isNotEmpty) ...{
          'contains': Uri.encodeFull(query),
        },
        if (lang case var lang? when lang.isNotEmpty) 'lang': lang,
        if (amount case var amount? when amount > 1) 'amount': '$amount',
        if (type != null) 'type': type.code,
        'safe-mode': safeMode,
        'format': 'json',
      },
    );

    final response = await _client.get(uri);
    final responseMap = json.decode(response.body);
    return JokesResponse.fromJson(responseMap);
  }

  @override
  Future<InfoResponse> getInfo({String? lang}) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: 'v2.jokeapi.dev',
      path: 'info',
      queryParameters: {
        if (lang != null) 'lang': lang,
        'format': 'json',
      },
    );

    final response = await _client.get(uri);
    final responseMap = json.decode(response.body);
    return InfoResponse.fromJson(responseMap);
  }
}
