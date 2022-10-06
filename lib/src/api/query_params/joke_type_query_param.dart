import '../query_param.dart';

enum JokeType { single, twopart }

class JokeTypeQueryParam extends QueryParam {
  @override
  final String name = 'type';
  final JokeType type;

  const JokeTypeQueryParam(this.type);

  @override
  String get option => type.name;
}
