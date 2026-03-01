import 'package:dorimol/features/authorization/bloc/authorization_bloc.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class SmsTextField extends StatefulWidget {
  const SmsTextField({
    super.key,
    required this.colorTheme,
    required this.controller,
    this.incorrectPin,
    this.message
  });

  final AppColors colorTheme;
  final TextEditingController controller;
  final String? incorrectPin;
  final String? message;

  @override
  State<SmsTextField> createState() => _SmsTextFieldState();
}

class _SmsTextFieldState extends State<SmsTextField> {
  final _formKey = GlobalKey<FormState>();
  bool wait = false;

  @override
  void didUpdateWidget(covariant SmsTextField oldWidget) {
    if (widget.incorrectPin != oldWidget.incorrectPin){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        wait = false;
        _formKey.currentState!.validate();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Код из смс", style: AppText.b1.copyWith(color: widget.colorTheme.iconGray)),
        const SizedBox(height: 4),
        Form(
          key: _formKey,
          child: Pinput(
            length: 6,
            controller: widget.controller,
            defaultPinTheme: PinTheme(
              width: 46,
              height: 46,
              textStyle: AppText.h1.copyWith(color: widget.colorTheme.textBlack),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: widget.colorTheme.tips, width: 2),
              ),
            ),
            focusedPinTheme: PinTheme(
              width: 46,
              height: 46,
              textStyle: AppText.h1.copyWith(color: widget.colorTheme.textBlack),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: widget.colorTheme.seedColor, width: 2),
              ),
            ),
            submittedPinTheme: PinTheme(
              width: 46,
              height: 46,
              textStyle: AppText.h1.copyWith(color: widget.colorTheme.textBlack),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: widget.colorTheme.seedColor, width: 2),
              ),
            ),
            errorPinTheme: PinTheme(
              width: 46,
              height: 46,
              textStyle: AppText.h1.copyWith(color: widget.colorTheme.textBlack),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: widget.colorTheme.red, width: 2),
              ),
            ),
            useNativeKeyboard: true,
            showCursor: true,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            errorText: widget.message,
            errorTextStyle: AppText.b3.copyWith(color: widget.colorTheme.red),
            validator: (value) => widget.incorrectPin == value && !wait ? widget.message : null,
            onChanged: (value) async {
              if (value.length == 6){
                BlocProvider.of<AuthorizationBloc>(context).add(VerifyCode(smsCode: value));
                wait = true;
              }
            },
          ),
        ),
      ],
    );
  }
}