import 'path_param.dart';
import 'query_param.dart';

abstract class JokeApiRequest {
  final String path;
  final PathParam? pathParameter;
  final List<QueryParam> queryParameters;

  const JokeApiRequest(
    this.path, {
    this.pathParameter,
    this.queryParameters = const [],
  });

  String get method;
}
