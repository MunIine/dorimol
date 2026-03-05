import 'package:auto_route/auto_route.dart';
import 'package:dorimol/data/services/config_service.dart';
import 'package:dorimol/data/services/ui_service.dart';
import 'package:dorimol/data/text_input_formatters.dart';
import 'package:dorimol/features/account/bio/bloc/account_bloc.dart';
import 'package:dorimol/widgets/dropdowns/city_dropdown.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class AccountBIOScreen extends StatefulWidget {
  const AccountBIOScreen({super.key, required this.colorTheme});

  final AppColors colorTheme;

  @override
  State<AccountBIOScreen> createState() => _AccountBIOScreenState();
}

class _AccountBIOScreenState extends State<AccountBIOScreen> {
  final nameCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final nameNotifier = ValueNotifier<String>('');
  final List<String> cities = GetIt.I<ConfigService>().serverConfig.deliveryCities;
  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        if (state is AccountLoaded) {
          if (!state.editMode){
            nameNotifier.value = state.user.name;
            nameCtrl.text = state.user.name;
            addressCtrl.text = state.user.address ?? (state.editMode ? "" : "Не указан");
            selectedCity = state.user.city;
          }
          if (!cities.contains(selectedCity)) {
            selectedCity = null;
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
                        AccountBioField(
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
                        selectedCity: selectedCity,
                        hint: (selectedCity == null && !state.editMode) ?
                          Text("Не указан", style: AppText.t5.copyWith(color: widget.colorTheme.textBlack)) : null,
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
                        onChanged: state.editMode ? (value) {
                          setState(() {
                            if (selectedCity == value) { //TODO: более оптимальная перерисовка при обновлении значения
                              selectedCity = null;
                              return;
                            }
                            selectedCity = value;
                          });
                        } : null,
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
                        AccountBioField(
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
                          onPressed: value.isNotEmpty ? () {
                            context.read<NavBarController>().show();
                            context.read<AccountBloc>().add(UpdateAccountBio(
                              name: nameCtrl.text,
                              city: selectedCity,
                              address: addressCtrl.text.isNotEmpty ? addressCtrl.text : null,
                            ));
                          } : null,
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
}

class AccountBioField extends StatelessWidget {
  const AccountBioField({
    super.key,
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