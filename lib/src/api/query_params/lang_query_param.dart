import '../query_param.dart';

/// Currently available system languages: cs, de, en, it, ru
///   Currently available joke languages: cs, de, en, es, fr, pt
class LangQueryParam extends QueryParam {
  @override
  final String name = 'lang';
  @override
  final String option;

  const LangQueryParam(String lang)
      : assert(
          lang == 'cs' ||
              lang == 'de' ||
              lang == 'en' ||
              lang == 'it' ||
              lang == 'ru' ||
              lang == 'es' ||
              lang == 'fr' ||
              lang == 'pt',
          'Unsupported language',
        ),
        option = lang;
}
