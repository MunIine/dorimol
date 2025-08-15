import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberTextFieldBlock extends StatefulWidget {
  const NumberTextFieldBlock({super.key, required this.colorTheme});

  final AppColors colorTheme;

  @override
  State<NumberTextFieldBlock> createState() => _NumberTextFieldBlockState();
}

class _NumberTextFieldBlockState extends State<NumberTextFieldBlock> {
  final TextEditingController controller = TextEditingController();
  bool completed = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    controller.removeListener(_onTextChanged);
    controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    if (controller.text.trim().replaceAll(" ", "").length == 8 && !completed){
      setState(() {
        completed = true;
      });
    }
    if (controller.text.trim().replaceAll(" ", "").length != 8 && completed){
      setState(() {
        completed = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: widget.colorTheme.formInput,
            ),
            child: TextField(
              controller: controller,
              enabled: true,
              keyboardType: TextInputType.phone,
              style: AppText.b4.copyWith(color: widget.colorTheme.textBlack),
              maxLength: 11, // 8 цифр + 2 пробела + 1 запас
              buildCounter: (context, {required currentLength, required isFocused, required maxLength}) => null,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    "+373",
                    style: AppText.b4.copyWith(color: widget.colorTheme.textBlack),
                  ),
                ),
                prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                hintText: "XXX XXX XX",
                enabledBorder: completed ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                  color: widget.colorTheme.seedColor,
                  width: 2,
                  ),
                ) : null,
                focusedBorder: completed ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                  color: widget.colorTheme.seedColor,
                  width: 2,
                  ),
                ) : null,
              ),
              inputFormatters: [
                _PrefixPhoneInputFormatter(""),
                _PhoneNumberFormatter(),
              ],
              onSubmitted: (_) {},
            ),
          ),
        ),
      const SizedBox(width: 8),
      SizedBox(
        width: 48,
        height: 48,
        child: IconButton(
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            disabledBackgroundColor: widget.colorTheme.tips,
            padding: EdgeInsets.zero,
            backgroundColor: widget.colorTheme.seedColor,
            elevation: 0,
          ),
          onPressed: completed ? () {} : null,
          icon: Icon(
              Icons.send,
              color: widget.colorTheme.background,
            ),
          ),
        ),
      ],
    );
  }
}

// Форматтер для визуального разделения номера: xxx xx xxx
class _PhoneNumberFormatter extends TextInputFormatter {
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
class _PrefixPhoneInputFormatter extends TextInputFormatter {
  _PrefixPhoneInputFormatter(this.prefix);
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