import '../query_param.dart';

class ContainsQueryParam extends QueryParam {
  @override
  final String name = 'contains';
  final String query;

  const ContainsQueryParam(this.query);

  @override
  String get option => query;
}
