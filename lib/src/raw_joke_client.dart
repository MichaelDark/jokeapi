import 'package:http/http.dart' as http;

import 'models/options.dart';
import 'models/request_options/request_options.dart';

// TODO(mike): Add missing endpoints POST  https://v2.jokeapi.dev/submit
// TODO(mike): Add error handling
// TODO(mike): Add client client with parsing
class RawJokeClient {
  static const _defaultHostname = 'v2.jokeapi.dev';

  final String hostname;
  final http.Client client;

  RawJokeClient({
    this.hostname = _defaultHostname,
    http.Client? client,
  }) : client = client ?? http.Client();

  Future<http.Response> getJoke(JokeOptions options) async {
    return _makeApiCall("joke", options);
  }

  Future<http.Response> getInfo([FormatLangOptions? options]) async {
    return _makeApiCall("info", options);
  }

  Future<http.Response> getCategories([FormatLangOptions? options]) async {
    return _makeApiCall("categories", options);
  }

  Future<http.Response> getLangCode(LangCodeOptions options) async {
    return _makeApiCall("langcode", options);
  }

  Future<http.Response> getLanguages([FormatLangOptions? options]) async {
    return _makeApiCall("languages", options);
  }

  Future<http.Response> getFlags([FormatLangOptions? options]) async {
    return _makeApiCall("flags", options);
  }

  Future<http.Response> getFormats([FormatLangOptions? options]) async {
    return _makeApiCall("formats", options);
  }

  Future<http.Response> ping([FormatLangOptions? options]) async {
    return _makeApiCall("ping", options);
  }

  Future<http.Response> getEndpoints([FormatOptions? options]) async {
    return _makeApiCall("endpoints", options);
  }

  Future<http.Response> _makeApiCall(
    String path, [
    RequestOptions? options,
  ]) async {
    final pathSegments = options?.pathSegments;
    final queryParameters = options?.queryParameters;
    final uri = Uri(
      scheme: 'https',
      host: hostname,
      pathSegments: [
        path,
        if (pathSegments != null) ...pathSegments,
      ],
      queryParameters: queryParameters == null || queryParameters.isEmpty
          ? null
          : queryParameters,
    );
    final response = await client.get(uri);
    return response;
  }
}
