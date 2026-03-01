import 'package:auto_route/auto_route.dart';
import 'package:dorimol/features/account/bio/bloc/account_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AccountBIOScreen extends StatelessWidget {
  const AccountBIOScreen({super.key, required this.colorTheme});

  final AppColors colorTheme;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        if (state is AccountLoaded) {
          return Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Имя", style: AppText.t2.copyWith(color: colorTheme.iconGray)),
                      const SizedBox(height: 4),
                      Text(state.user.name, style: AppText.t5.copyWith(color: colorTheme.textBlack)),
                    ],
                  ),
                  const Spacer(),
                  Icon(SvgIcons.edit, color: colorTheme.tips, size: 16),
                ],
              ),
              Divider(color: colorTheme.formInput),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Телефон", style: AppText.t2.copyWith(color: colorTheme.iconGray)),
                      const SizedBox(height: 4),
                      Text(state.user.phone, style: AppText.t5.copyWith(color: colorTheme.textBlack)), //TODO: валидатор
                    ],
                  ),
                  const Spacer(),
                  Icon(Icons.done_rounded, color: colorTheme.seedColor, size: 20),
                ],
              ),
              Divider(color: colorTheme.formInput),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Город", style: AppText.t2.copyWith(color: colorTheme.iconGray)),
                      const SizedBox(height: 4),
                      Text(state.user.city ?? "Не указан", style: AppText.t5.copyWith(color: colorTheme.textBlack)),
                    ],
                  ),
                  const Spacer(),
                  Icon(SvgIcons.edit, color: colorTheme.tips, size: 16),
                ],
              ),
              Divider(color: colorTheme.formInput),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Адрес", style: AppText.t2.copyWith(color: colorTheme.iconGray)),
                      const SizedBox(height: 4),
                      Text(state.user.address ?? "Не указан", style: AppText.t5.copyWith(color: colorTheme.textBlack)),
                    ],
                  ),
                  const Spacer(),
                  Icon(SvgIcons.edit, color: colorTheme.tips, size: 16),
                ],
              ),
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
