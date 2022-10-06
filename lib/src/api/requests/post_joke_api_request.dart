import '../joke_api_request.dart';

class PostJokeApiRequest extends JokeApiRequest {
  const PostJokeApiRequest(
    super.path, {
    super.pathParameter,
    super.queryParameters = const [],
  });

  @override
  String get method => 'POST';
}
