part of 'catalog_bloc.dart';

sealed class CatalogState extends Equatable {
  const CatalogState({required this.sorting});
  
  final Sorting sorting;

  @override
  List<Object> get props => [sorting];

  CatalogState copyWith({Sorting? sorting}) {
    return CatalogInitial(sorting: sorting ?? this.sorting);
  }
}

final class CatalogInitial extends CatalogState {
  const CatalogInitial({required super.sorting});

  @override
  CatalogInitial copyWith({Sorting? sorting}) {
    return CatalogInitial(sorting: sorting ?? this.sorting);
  }
}

final class CatalogLoading extends CatalogState {
  const CatalogLoading({required super.sorting});

  @override
  CatalogLoading copyWith({Sorting? sorting}) {
    return CatalogLoading(sorting: sorting ?? this.sorting);
  }
}

final class CatalogLoaded extends CatalogState {
  const CatalogLoaded({required this.products, required super.sorting});

  final List<Product> products;

  @override
  List<Object> get props => [products, sorting];

  @override
  CatalogLoaded copyWith({
    List<Product>? products,
    Sorting? sorting,
  }) {
    return CatalogLoaded(
      products: products ?? this.products,
      sorting: sorting ?? this.sorting,
    );
  }
}
final class CatalogNotFound extends CatalogState {
  const CatalogNotFound({required super.sorting});

  @override
  CatalogNotFound copyWith({Sorting? sorting}) {
    return CatalogNotFound(sorting: sorting ?? this.sorting);
  }
}
final class CatalogFailure extends CatalogState {
  const CatalogFailure({required this.error, required super.sorting});

  final Exception error;

  @override
  List<Object> get props => [error, sorting];

  @override
  CatalogFailure copyWith({
    Exception? error,
    Sorting? sorting,
  }) {
    return CatalogFailure(
      error: error ?? this.error,
      sorting: sorting ?? this.sorting,
    );
  }
}