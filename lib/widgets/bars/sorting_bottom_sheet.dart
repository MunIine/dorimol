import 'package:dorimol/data/constants.dart';
import 'package:dorimol/screens/catalog/bloc/catalog_bloc.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortingBottomSheet extends StatelessWidget {
  const SortingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;
    final selected = context.select<CatalogBloc, Sorting>((bloc) => bloc.state.sorting);

    return SizedBox(
      height: 430,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(), 
                  icon: Icon(
                    SvgIcons.xCirleFilled,
                    color: colorTheme.tips,
                  )
                ),
                Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Сортировка", style: AppText.h1.copyWith(color: colorTheme.textBlack),),
                    Text("Сохраняется, пока вы их не отмените", style: AppText.t3.copyWith(color: colorTheme.iconGray)),
                  ],
                ),
                Spacer(),
                SizedBox(width: 24)
              ],
            ),
            SizedBox(height: 10),
            Divider(),
            Expanded(
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                itemCount: Sorting.values.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) => SortingListElement(
                  sorting: Sorting.values[index],
                  selected: selected == Sorting.values[index],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SortingListElement extends StatelessWidget {
  const SortingListElement({
    super.key, required this.sorting, required this.selected,
  });

  final Sorting sorting;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return GestureDetector(
      onTap: () => context.read<CatalogBloc>().add(ChangeSortingMethod(sorting: sorting)),
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(sorting.presentationValue, style: AppText.t6.copyWith(color: Color(0xFF626262))),
            selected ? Icon(SvgIcons.radioButtonOn, color: colorTheme.seedColor) : Icon(SvgIcons.radioButtonOff, color: colorTheme.block)
          ],
        ),
      ),
    );
  }
}