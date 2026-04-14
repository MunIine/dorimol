import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dorimol/data/services/config_service.dart';
import 'package:dorimol/data/services/ui_service.dart';
import 'package:dorimol/data/text_input_formatters.dart';
import 'package:dorimol/features/account/bio/bloc/account_bloc.dart';
import 'package:dorimol/models/user.dart';
import 'package:dorimol/widgets/dropdowns/city_dropdown.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class AccountBIOScreen extends StatefulWidget {
  const AccountBIOScreen({super.key, required this.colorTheme, required this.pendingAvatarNotifier});

  final AppColors colorTheme;
  final ValueNotifier<File?> pendingAvatarNotifier;

  @override
  State<AccountBIOScreen> createState() => _AccountBIOScreenState();
}

class _AccountBIOScreenState extends State<AccountBIOScreen> {
  final nameCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final nameNotifier = ValueNotifier<String>('');
  final cityNotifier = ValueNotifier<String?>(null);
  final List<String> cities = GetIt.I<ConfigService>().serverConfig.deliveryCities;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        if (state is AccountLoaded) {
          if (!state.editMode){
            nameNotifier.value = state.user.name;
            nameCtrl.text = state.user.name;
            addressCtrl.text = state.user.address ?? "Не указан";
            cityNotifier.value = state.user.city;
          }
          if (state.editMode && addressCtrl.text == "Не указан"){
            addressCtrl.text = "";
          }
          if (!cities.contains(cityNotifier.value)) {
            cityNotifier.value = null;
          }

          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Имя", style: AppText.t2.copyWith(color: widget.colorTheme.iconGray)),
                        const SizedBox(height: 4),
                        _AccountBioField(
                          onChanged: (value) => nameNotifier.value = value,
                          colorTheme: widget.colorTheme, 
                          controller: nameCtrl, 
                          editMode: state.editMode,
                          limit: 15,
                          hint: "Введите имя",
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 4),
                  state.editMode ?
                  Icon(SvgIcons.edit, color: widget.colorTheme.tips, size: 16) :
                  Icon(Icons.done_rounded, color: widget.colorTheme.seedColor, size: 20),
                ],
              ),
              Divider(color: widget.colorTheme.formInput),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Телефон", style: AppText.t2.copyWith(color: widget.colorTheme.iconGray)),
                        const SizedBox(height: 4),
                        Text(formatPhoneNumber(state.user.phone), style: AppText.t5.copyWith(color: widget.colorTheme.textBlack)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(Icons.done_rounded, color: widget.colorTheme.seedColor, size: 20),
                ],
              ),
              Divider(color: widget.colorTheme.formInput),
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Город", style: AppText.t2.copyWith(color: widget.colorTheme.iconGray)),
                      const SizedBox(height: 4),
                      CityDropdown(
                        colorTheme: widget.colorTheme, 
                        cities: cities, 
                        cityNotifier: cityNotifier,
                        disabledHint: Text("Не указан", style: AppText.t5.copyWith(color: widget.colorTheme.textBlack)),
                        enabled: state.editMode,
                        dropdownStyleData: DropdownStyleData(
                          padding: EdgeInsets.zero,
                          maxHeight: 150,
                          elevation: 0,
                          decoration: BoxDecoration(
                            color: widget.colorTheme.background,
                            borderRadius: BorderRadius.circular(16)
                          ),
                        ),
                        iconStyleData: const IconStyleData(icon: SizedBox()),
                        buttonStyleData: const ButtonStyleData(
                          height: 22,
                          padding: EdgeInsets.zero,
                        ),
                      )
                    ],    
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: state.editMode ?
                    Transform.rotate(angle: -1.5708, child: Icon(Icons.arrow_back_ios_new_rounded, color: widget.colorTheme.tips, size: 20)) :
                    Icon(Icons.done_rounded, color: widget.colorTheme.seedColor, size: 20)
                  ),                
                ],
              ),
              Divider(color: widget.colorTheme.formInput),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Адрес", style: AppText.t2.copyWith(color: widget.colorTheme.iconGray)),
                        const SizedBox(height: 4),
                        _AccountBioField(
                          colorTheme: widget.colorTheme, 
                          controller: addressCtrl, 
                          editMode: state.editMode,
                          limit: 100,
                          hint: "Введите адрес",
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 4),
                  state.editMode ?
                  Icon(SvgIcons.edit, color: widget.colorTheme.tips, size: 16) :
                  Icon(Icons.done_rounded, color: widget.colorTheme.seedColor, size: 20),
                ],
              ),
              if (state.editMode) const SizedBox(height: 12),
              if (state.editMode) Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        context.read<NavBarController>().show();
                        context.read<AccountBloc>().add(const ToggleEditMode());
                        widget.pendingAvatarNotifier.value = null;
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: widget.colorTheme.red.withAlpha(220)
                      ),
                      child: Text("Отменить", style: AppText.b6.copyWith(color: Colors.white))
                    ),
                  ),
                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: nameNotifier,
                      builder: (_, value, _) {
                        return TextButton(
                          onPressed: value.isNotEmpty ? () => submitForm(state.user) : null,
                          style: TextButton.styleFrom(
                            backgroundColor: widget.colorTheme.lopyGreen,
                            disabledBackgroundColor: widget.colorTheme.tips
                          ),
                          child: Text("Сохранить", style: AppText.b6.copyWith(color: Colors.white))
                        );
                      }
                    ),
                  )
                ],
              )
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator()
        );
      }
    );
  }

  void submitForm (User user){
    final Map<String, String?> body = {};
    final File? avatar = widget.pendingAvatarNotifier.value;

    if (nameCtrl.text.trim() != user.name){
      body['name'] = nameCtrl.text.trim();
    }
    if (cityNotifier.value?.trim() != user.city){
      body['city'] = cityNotifier.value?.trim();
    }
    if (addressCtrl.text.trim().isNotEmpty && addressCtrl.text.trim() != user.address){
      body['address'] = addressCtrl.text.trim();
    }
    if (addressCtrl.text.trim().isEmpty && null != user.address){
      body['address'] = null;
    }
    if (body.isEmpty && avatar == null) {
      context.read<AccountBloc>().add(const ToggleEditMode());
      return;
    }

    final bloc = context.read<AccountBloc>();
    final navBarController = context.read<NavBarController>();

    bloc.add(UpdateAccountBio(
      body: body, 
      avatar: avatar
    ));
    bloc.stream.firstWhere(
      (state) => state is AccountLoaded || state is AccountFailure
    ).then((_) {
       navBarController.show();
       widget.pendingAvatarNotifier.value = null; 
      }
    );
  }
}

class _AccountBioField extends StatelessWidget {
  const _AccountBioField({
    required this.colorTheme,
    required this.controller,
    required this.editMode,
    required this.limit,
    this.hint,
    this.onChanged,
  });

  final AppColors colorTheme;
  final TextEditingController controller;
  final bool editMode;
  final int limit;
  final String? hint;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: !editMode,
      showCursor: editMode,
      enableInteractiveSelection: editMode,
      onChanged: onChanged,
      style: AppText.t5.copyWith(color: colorTheme.textBlack),
      inputFormatters: [LengthLimitingTextInputFormatter(limit)],
      decoration:  InputDecoration(
        border: InputBorder.none,
        isDense: true,
        contentPadding: EdgeInsets.zero,
        hint: hint != null ? Text(
          hint!,
          style: AppText.t3.copyWith(color: colorTheme.tips),
        ) : null
      ),
    );
  }
}