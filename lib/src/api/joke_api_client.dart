import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;

import 'joke_api_config.dart';
import 'joke_api_request.dart';

class JokeApiClient {
  const JokeApiClient();

  Future<http.Response> makeRequest(JokeApiRequest request) async {
    final Uri uri = _createUri(request);
    print('Making request to: $uri');

    final http.Response response;

    switch (request.method.toLowerCase()) {
      case 'post':
        response = await http.post(uri);
        break;
      case 'get':
        response = await http.get(uri);
        break;
      default:
        throw Exception('Request has unsupported HTTP method');
    }

    return response;
  }

  Uri _createUri(JokeApiRequest request) {
    final params = {
      for (final queryParameter in request.queryParameters) ...{
        ...queryParameter.options,
      }
    };
    final Uri uri = Uri(
      scheme: JokeApiConfig.scheme,
      host: JokeApiConfig.hostname,
      path: p.join(request.path, request.pathParameter?.createPath()),
      queryParameters: params.isNotEmpty ? params : null,
    );
    return uri;
  }
}
