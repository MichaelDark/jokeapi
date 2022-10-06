import '../query_param.dart';

class IdRangeQueryParam extends QueryParam {
  @override
  final String name = 'idRange';
  final int from;
  final int? to;

  const IdRangeQueryParam({required this.from, this.to})
      : assert(from >= 0),
        assert(to == null || to > from);

  @override
  String get option => to == null || from == to ? '$from' : '$from-$to';
}
