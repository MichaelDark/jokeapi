import '../path_param.dart';

class LanguagePathParam extends PathParam {
  final String language;

  const LanguagePathParam(this.language);

  @override
  String createPath() => language;
}
