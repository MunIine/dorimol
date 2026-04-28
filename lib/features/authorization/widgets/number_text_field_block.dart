import 'package:dorimol/data/text_input_formatters.dart';
import 'package:dorimol/features/authorization/bloc/authorization_bloc.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                  color: completed ? widget.colorTheme.seedColor : widget.colorTheme.tips,
                  width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                  color: completed ? widget.colorTheme.seedColor : widget.colorTheme.tips,
                  width: 2,
                  ),
                ),
              ),
              inputFormatters: [
                PrefixPhoneInputFormatter(""),
                PhoneNumberFormatter(),
              ],
              onSubmitted: (_) async {
                if (completed) {
                  BlocProvider.of<AuthorizationBloc>(context).add(SendCode(phone: "+373${controller.text.replaceAll(" ", "")}"));
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}