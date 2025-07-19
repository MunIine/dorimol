import 'package:auto_route/auto_route.dart';
import 'package:dorimol/router/router.dart';
import 'package:dorimol/screens/catalog/bloc/catalog_bloc.dart';
import 'package:dorimol/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlockTextField extends StatelessWidget {
  const BlockTextField({
    super.key,
    required this.colorTheme, 
    required this.hint, 
    this.form = false,
    this.enabled = true, 
    this.icon, 
  });

  final AppColors colorTheme;
  final bool form;
  final bool enabled;
  final String hint;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Container(
      decoration: BoxDecoration(
        color: form ? colorTheme.formInput : colorTheme.block,
        borderRadius: BorderRadius.circular(12)
      ),
      child: TextField(
        controller: controller,
        enabled: enabled,
        style: TextStyle(
          fontSize: 15
        ),
        decoration: InputDecoration(
          hintText: hint,
          suffixIconConstraints: BoxConstraints(
            minHeight: 0,
            minWidth: 0
          ),
          suffixIcon: icon
        ),
        onSubmitted: (value) {
          if (value.isNotEmpty){
            BlocProvider.of<CatalogBloc>(context).add(FetchCatalogByQuery(idOrName: value.trim()));
            if (AutoRouter.of(context).current.name != CatalogRoute.name) AutoRouter.of(context).push(CatalogRoute());
          } 
        }
      ),
    );
  }
}