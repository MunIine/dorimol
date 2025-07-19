import 'package:auto_route/auto_route.dart';
import 'package:dorimol/router/router.dart';
import 'package:dorimol/screens/catalog/bloc/catalog_bloc.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/bars/sorting_bottom_sheet.dart';
import 'package:dorimol/widgets/helpers/block_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key, this.sliders = false, this.defaultTextFieldText});

  final bool sliders;
  final String? defaultTextFieldText;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;
    final controller = TextEditingController();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: BlockTextField(
            colorTheme: colorTheme, hint: "Найти продукты",
            defaultText: defaultTextFieldText ?? "",
            controller: controller,
            onSubmitted: (value) {
              if (value.isNotEmpty){
                BlocProvider.of<CatalogBloc>(context).add(FetchCatalogByQuery(idOrName: value.trim()));
                if (AutoRouter.of(context).current.name != CatalogRoute.name) {
                  AutoRouter.of(context).push(CatalogRoute(query: value));
                  controller.text = "";
                }
              } 
            },
          )
        ),
        if(sliders)...[
          SizedBox(width: 4),
          BoxIconButton(icon: SvgIcons.sliders)
        ],
      ],
    );
  }
}

class BoxIconButton extends StatelessWidget {
  const BoxIconButton({
    super.key, 
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        size: 18.5,
      ),
      onPressed: () => showModalBottomSheet(
        backgroundColor: Theme.of(context).extension<AppColors>()!.background,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
        context: context,
        builder: (context) => SortingBottomSheet()
      ),
      padding: EdgeInsets.all(15),
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12)
        )
      ),
    );
  }
}