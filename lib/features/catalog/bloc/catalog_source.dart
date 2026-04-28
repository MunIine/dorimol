part of 'catalog_bloc.dart';

sealed class CatalogSource {
  const CatalogSource();
}

class CategorySource extends CatalogSource {
  const CategorySource(this.categoryId);
  final int categoryId;
}

class QuerySource extends CatalogSource {
  const QuerySource(this.query);
  final String query;
}