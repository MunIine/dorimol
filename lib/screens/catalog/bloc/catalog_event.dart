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