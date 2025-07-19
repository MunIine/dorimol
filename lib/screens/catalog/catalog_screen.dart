import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:dorimol/api/models/category.dart';
import 'package:dorimol/screens/catalog/bloc/catalog_bloc.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/export.dart';
import 'package:dorimol/widgets/helpers/return_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key, this.category});

  final Category? category;

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.category != null) BlocProvider.of<CatalogBloc>(context).add(FetchCatalog(categoryId: widget.category!.id));
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: AppBar(
        leading: ReturnButton(),
        title: widget.category != null ? Text(widget.category!.name, style: AppText.h2.copyWith(letterSpacing: 2.5, color: colorTheme.seedColor)) : null,
        backgroundColor: Color(0xFFF9F9F9),
        surfaceTintColor: Color(0xFFF9F9F9),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            AppSearchBar(sliders: true),
            SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<CatalogBloc, CatalogState>(
                bloc: BlocProvider.of<CatalogBloc>(context),
                builder: (context, state) {
                  if (state is CatalogLoaded){
                    final products = state.products;
                    return GridView.builder(
                      itemCount: products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 185 / 285,
                      ),
                      itemBuilder: (context, index) => ProductCard(
                        inCart: [false, true][Random().nextInt(2)],
                        product: products[index],
                      ),
                    );
                  }
                  if (state is CatalogLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Center(child: Text("Ошибка загрузки товаров"));
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
