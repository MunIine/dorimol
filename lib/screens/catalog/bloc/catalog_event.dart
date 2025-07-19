part of 'catalog_bloc.dart';

sealed class CatalogEvent extends Equatable {
  const CatalogEvent();

  @override
  List<Object> get props => [];
}

class FetchCatalog extends CatalogEvent {
  final int categoryId;

  const FetchCatalog({required this.categoryId});

  @override
  List<Object> get props => [categoryId];
}

class FetchCatalogByQuery extends CatalogEvent {
  final String idOrName;

  const FetchCatalogByQuery({required this.idOrName});

  @override
  List<Object> get props => [idOrName];
}

class ChangeSortingMethod extends CatalogEvent {
  final Sorting sorting;

  const ChangeSortingMethod({required this.sorting});

  @override
  List<Object> get props => [sorting];
}