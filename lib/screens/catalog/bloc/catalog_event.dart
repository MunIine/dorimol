part of 'catalog_bloc.dart';

sealed class CatalogEvent extends Equatable {
  const CatalogEvent();

  @override
  List<Object> get props => [];
}

class FetchCatalog extends CatalogEvent {

  const FetchCatalog({required this.categoryId});
  final int categoryId;

  @override
  List<Object> get props => [categoryId];
}

class FetchCatalogByQuery extends CatalogEvent {

  const FetchCatalogByQuery({required this.idOrName});
  final String idOrName;

  @override
  List<Object> get props => [idOrName];
}

class ChangeSortingMethod extends CatalogEvent {

  const ChangeSortingMethod({required this.sorting});
  final Sorting sorting;

  @override
  List<Object> get props => [sorting];
}

class ResetCatalog extends CatalogEvent {
  const ResetCatalog();

  @override
  List<Object> get props => [];
}