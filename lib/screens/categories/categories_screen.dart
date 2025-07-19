import 'package:auto_route/annotations.dart';
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSearchBar(sliders: true),
            SizedBox(height: 16),
            Text("Категории", style: AppText.h1),
            SizedBox(height: 16),
            BlocBuilder<CategoriesBloc, CategoriesState>(
              bloc: BlocProvider.of<CategoriesBloc>(context),
              builder: (context, state) {
                if (state is CategoriesLoaded){
                  return Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      itemBuilder: (BuildContext context, int index) => CategoryCard(
                        category: state.categories[index],
                      ),
                      separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10),
                      itemCount: state.categories.length,
                    ),
                  );
                }
                if (state is CategoriesLoading) {
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return Center(child: Text("Ошибка загрузки категорий"));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
