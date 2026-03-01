import 'package:flutter/services.dart';

// Форматтер для визуального разделения номера: xxx xx xxx
class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    String formatted = '';
    for (int i = 0; i < digits.length && i < 8; i++) {
      if (i == 3 || i == 6) formatted += ' ';
      formatted += digits[i];
    }
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

// Кастомный TextInputFormatter, запрещающий удалять префикс
class PrefixPhoneInputFormatter extends TextInputFormatter {
  PrefixPhoneInputFormatter(this.prefix);
  final String prefix;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (!newValue.text.startsWith(prefix)) {
      // Если пользователь пытается удалить или изменить префикс, возвращаем старое значение
      return oldValue;
    }
    // Не даём удалить префикс, но разрешаем редактировать после него
    if (newValue.text.length < prefix.length) {
      return oldValue;
    }
    return newValue;
  }
}

// Форматтер для визуального разделения номера: xxx xx xxx
String formatPhoneNumber(String phone) {
  String digits = phone.replaceAll(RegExp(r'\D'), '');
  String formatted = '+';
  for (int i = 0; i < digits.length && i < 11; i++) {
    if (i == 3 || i == 6 || i == 9) formatted += ' ';
    formatted += digits[i];
  }
  return formatted;
}