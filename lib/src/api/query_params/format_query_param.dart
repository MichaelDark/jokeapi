import '../query_param.dart';

class FormatQueryParam extends QueryParam {
  @override
  final String name = 'format';
  @override
  final String option;

  const FormatQueryParam.json() : option = 'json';
  const FormatQueryParam.xml() : option = 'xml';
  const FormatQueryParam.yaml() : option = 'yaml';
  const FormatQueryParam.txt() : option = 'txt';
}
