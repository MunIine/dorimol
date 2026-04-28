import 'package:dio/dio.dart';
import 'package:dorimol/api/public_api_client.dart';
import 'package:dorimol/data/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dorimol/models/product.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';
part 'catalog_source.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(CatalogInitial(sorting: Sorting.defaultSorting)) {
    on<FetchCatalog>((event, emit) async {
      await _fetchCatalog(event.categoryId, emit);
    });
    on<FetchCatalogByQuery>((event, emit) async {
      await _fetchCatalogByQuery(event.idOrName, emit);
    });
    on<ChangeSortingMethod>((event, emit) async{
      final source = state.source;
      if (source == null) {
        emit(state.copyWith(sorting: event.sorting));
        return;
      }

      switch (source) {
        case CategorySource(:final categoryId):
          await _fetchCatalog(categoryId, emit, sortingOverride: event.sorting);
        case QuerySource(:final query):
          await _fetchCatalogByQuery(query, emit, sortingOverride: event.sorting);
      }
    });
  }

  Future<void> _fetchCatalog(int categoryId, Emitter<CatalogState> emit, {Sorting? sortingOverride}) async {
    final sorting = sortingOverride ?? state.sorting;
    final source = CategorySource(categoryId);

    try {
      emit(CatalogLoading(sorting: sorting, source: source));
      final products = await apiClient.fetchProductsByCategory(categoryId, sorting.value);
      emit(CatalogLoaded(products: products, sorting: sorting, source: source));
    } on Exception catch (e) {
      emit(CatalogFailure(error: e, sorting: sorting, source: source));
    }
  }

  Future<void> _fetchCatalogByQuery(String idOrName, Emitter<CatalogState> emit, {Sorting? sortingOverride}) async {
    final sorting = sortingOverride ?? state.sorting;
    final source = QuerySource(idOrName);

    try {
      emit(CatalogLoading(sorting: sorting, source: source));
      final List<Product> products;
      if (int.tryParse(idOrName) != null){
        products = await apiClient.fetchProductsById(idOrName, sorting.value);
      }
      else{
        products = await apiClient.fetchProductsByName(idOrName, sorting.value);
      }
      emit(CatalogLoaded(products: products, sorting: sorting, source: source));
    } on DioException catch (e){
      if (e.type == DioExceptionType.badResponse && e.response?.statusCode == 404){
        emit(CatalogNotFound(sorting: sorting, source: source));
        return;
      }
      emit(CatalogFailure(error: e, sorting: sorting, source: source));
    } on Exception catch (e) {
      emit(CatalogFailure(error: e, sorting: sorting, source: source));
    }
  }

  final PublicApiClient apiClient = GetIt.I<PublicApiClient>();
}
