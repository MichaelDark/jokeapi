import '../query_param.dart';

class AmountQueryParam extends QueryParam {
  @override
  final String name = 'amount';
  final int amount;

  const AmountQueryParam(this.amount) : assert(amount > 0);

  @override
  String get option => '$amount';
}
