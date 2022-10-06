import '../query_param.dart';

class SafeModeQueryParam extends QueryParam {
  @override
  final String name = 'safe-mode';

  const SafeModeQueryParam();

  @override
  String? get option => null;
}
