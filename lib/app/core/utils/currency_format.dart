import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

final idFormater = NumberFormat.currency(
  locale: 'id_ID',
  symbol: 'Rp',
  decimalDigits: 0,
);

String formatCurrency(num amount) {
  return idFormater.format(amount);
}

class CurrencyInputFormatter extends TextInputFormatter {
  final NumberFormat _formatter =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final numericText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (numericText.isEmpty) {
      return const TextEditingValue(
        text: 'Rp 0',
        selection: TextSelection.collapsed(offset: 4),
      );
    }

    final number = int.parse(numericText);
    final newText = _formatter.format(number);

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
