import 'package:auto_route/auto_route.dart';
import 'package:dorimol/router/router.dart';
import 'package:dorimol/screens/categories/bloc/categories_bloc.dart';
import 'package:dorimol/screens/categories/widgets/category_card.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    BlocProvider.of<CategoriesBloc>(context).add(const FetchCategories());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 65),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppSearchBar(sliders: false),
          const SizedBox(height: 16),
          const Text("Категории", style: AppText.h1),
          const SizedBox(height: 16),
          BlocBuilder<CategoriesBloc, CategoriesState>(
            bloc: BlocProvider.of<CategoriesBloc>(context),
            builder: (context, state) {
              if (state is CategoriesLoaded) {
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 9,
                      crossAxisSpacing: 9,
                      childAspectRatio: 4 / 3,
                    ),
                    padding: EdgeInsets.zero,
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) =>
                        CategoryCard(category: state.categories[index], colorTheme: colorTheme),
                  ),
                );
              }
              if (state is CategoriesFailure) {
                AutoRouter.of(context).replace(ErrorRoute(exception: state.error));
              }
              return const Expanded(child: Center(child: CircularProgressIndicator()));
            },
          ),
        ],
      ),
    );
  }
}
