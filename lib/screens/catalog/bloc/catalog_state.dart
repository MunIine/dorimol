part of 'catalog_bloc.dart';

sealed class CatalogState extends Equatable {
  const CatalogState();
  
  @override
  List<Object> get props => [];
}

final class CatalogInitial extends CatalogState {}

final class CatalogLoading extends CatalogState {}

final class CatalogLoaded extends CatalogState {
  const CatalogLoaded({required this.products});

  final List<Product> products;

  @override
  List<Object> get props => super.props..addAll(products);
}

final class CatalogFailure extends CatalogState {
  const CatalogFailure({required this.error});

  final Object error;

  @override
  List<Object> get props => super.props..add(error);
}