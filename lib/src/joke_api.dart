import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;

import 'models/joke_category.dart';
import 'models/joke_flag.dart';
import 'models/joke_type.dart';
import 'models/responses/info_response.dart';
import 'models/responses/jokes_response.dart';

part 'joke_api_impl.dart';

/// [JokeAPI](https://jokeapi.dev/) client
abstract final class JokeApi {
  factory JokeApi({http.Client? client}) = _JokeApi;

  /// Return jokes for the specified paramters.
  ///
  /// Throws if API parsing failed.
  Future<JokesResponse> getJokes({
    List<JokeCategory> categories = const [JokeCategory.any],
    List<JokeFlag>? blacklistFlags,
    String? lang,
    ({int from, int? to})? idRange,
    String? contains,
    JokeType? type,
    int? amount,
    bool safeMode = true,
  });

  /// Return Joke API overview information.
  ///
  /// Throws if API parsing failed.
  Future<InfoResponse> getInfo({String? lang});
}
