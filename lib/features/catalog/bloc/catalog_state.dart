part of 'catalog_bloc.dart';

sealed class CatalogState extends Equatable {
  const CatalogState({required this.sorting, this.source});
  
  final Sorting sorting;
  final CatalogSource? source;

  CatalogState copyWith({Sorting? sorting, CatalogSource? source});

  @override
  List<Object?> get props => [sorting, source];
}

final class CatalogInitial extends CatalogState {
  const CatalogInitial({required super.sorting, super.source});

  @override
  CatalogInitial copyWith({Sorting? sorting, CatalogSource? source}) {
    return CatalogInitial(
      sorting: sorting ?? this.sorting,
      source: source ?? this.source,
    );
  }
}

final class CatalogLoading extends CatalogState {
  const CatalogLoading({required super.sorting, super.source});

  @override
  CatalogLoading copyWith({Sorting? sorting, CatalogSource? source}) {
    return CatalogLoading(
      sorting: sorting ?? this.sorting,
      source: source ?? this.source,
    );
  }
}

final class CatalogLoaded extends CatalogState {
  const CatalogLoaded({
    required this.products,
    required super.sorting,
    super.source,
  });

  final List<Product> products;

  @override
  CatalogLoaded copyWith({
    List<Product>? products,
    Sorting? sorting,
    CatalogSource? source,
  }) {
    return CatalogLoaded(
      products: products ?? this.products,
      sorting: sorting ?? this.sorting,
      source: source ?? this.source,
    );
  }

  @override
  List<Object?> get props => [products, sorting, source];
}
final class CatalogNotFound extends CatalogState {
  const CatalogNotFound({required super.sorting, super.source});

  @override
  CatalogNotFound copyWith({
    Sorting? sorting,
    CatalogSource? source
  }) {
    return CatalogNotFound(
      sorting: sorting ?? this.sorting,
      source: source ?? this.source,
    );
  }
}
final class CatalogFailure extends CatalogState {
  const CatalogFailure({required this.error, required super.sorting, super.source});

  final Exception error;

  @override
  CatalogFailure copyWith({
    Exception? error,
    Sorting? sorting,
    CatalogSource? source
  }) {
    return CatalogFailure(
      error: error ?? this.error,
      sorting: sorting ?? this.sorting,
      source: source ?? this.source,
    );
  }

  @override
  List<Object?> get props => [error, sorting, source];
}