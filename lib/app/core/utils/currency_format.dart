import 'package:intl/intl.dart';

final idFormater = NumberFormat.currency(
  locale: 'id_ID',
  symbol: 'Rp',
  decimalDigits: 0,
);

String formatCurrency(num amount) {
  return idFormater.format(amount);
}