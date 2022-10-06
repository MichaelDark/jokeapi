import '../query_param.dart';

class DryRunQueryParam extends QueryParam {
  @override
  final String name = 'dry-run';

  const DryRunQueryParam();

  @override
  String? get option => null;
}
