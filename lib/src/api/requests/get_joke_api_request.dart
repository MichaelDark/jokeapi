import '../joke_api_request.dart';

class GetJokeApiRequest extends JokeApiRequest {
  const GetJokeApiRequest(
    super.path, {
    super.pathParameter,
    super.queryParameters = const [],
  });

  @override
  String get method => 'GET';
}
