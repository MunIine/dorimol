import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:dorimol/models/category.dart';
import 'package:dorimol/router/router.dart';
import 'package:dorimol/features/catalog/bloc/catalog_bloc.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/errors/not_found.dart';
import 'package:dorimol/widgets/export.dart';
import 'package:dorimol/widgets/helpers/return_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key, this.category, this.query});

  final Category? category;
  final String? query;
  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;
    return BlocProvider(
      create: (context) => CatalogBloc()..add(FetchCatalog(categoryId: widget.category!.id)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  const ReturnButton(),
                  const Spacer(),
                  Text(
                    widget.category != null ? widget.category!.name : "Похожие товары",
                    style: AppText.h2.copyWith(letterSpacing: 2.5, color: colorTheme.seedColor),
                  ),
                  const Spacer(),
                  const SizedBox(width: 24),
                ],
              ),
            ),
            AppSearchBar(sliders: true, defaultTextFieldText: widget.query),
            Expanded(
              child: BlocBuilder<CatalogBloc, CatalogState>(
                builder: (context, state) {
                  if (state is CatalogLoaded) {
                    final products = state.products;
                    return GridView.builder(
                      itemCount: products.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 185 / 285,
                      ),
                      itemBuilder: (context, index) =>
                          ProductCard(inCart: [false, true][Random().nextInt(2)], product: products[index]),
                    );
                  }
                  if (state is CatalogNotFound) {
                    return Container(
                      padding: const EdgeInsets.only(top: 60),
                      height: 395,
                      width: 285,
                      child: const NotFound(),
                    );
                  }
                  if (state is CatalogFailure) {
                    AutoRouter.of(context).replace(ErrorRoute(exception: state.error));
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
