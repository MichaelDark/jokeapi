import '../query_param.dart';

enum BlacklistFlag { nsfw, religious, political, racist, sexist, explicit }

class BlacklistFlagsQueryParam extends QueryParam {
  @override
  final String name = 'blacklistFlags';
  final List<BlacklistFlag> flags;

  const BlacklistFlagsQueryParam(this.flags);

  @override
  String get option => flags.map((f) => f.name).join(',');
}
