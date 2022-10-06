abstract class QueryParam {
  const QueryParam();

  Map<String, String?> get options => {name: option};
  String get name;
  String? get option;
}
