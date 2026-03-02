import 'package:dio/dio.dart';
import 'package:dorimol/api/public_api_client.dart';
import 'package:dorimol/data/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dorimol/models/product.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(CatalogInitial(sorting: Sorting.defaultSorting)) {
    on<FetchCatalog>((event, emit) async {
      await _fetchCatalog(event, emit);
    });
    on<FetchCatalogByQuery>((event, emit) async {
      await _fetchCatalogByQuery(event, emit);
    });
    // TODO: Изменить логику блока при изменении сортировки
    on<ChangeSortingMethod>((event, emit) async{
      emit(state.copyWith(sorting: event.sorting));
      if (prevEvent is FetchCatalog){
        await _fetchCatalog(prevEvent as FetchCatalog, emit);
      }
      if (prevEvent is FetchCatalogByQuery){
        await _fetchCatalogByQuery(prevEvent as FetchCatalogByQuery, emit);
      }
    });
    on<ResetCatalog>((event, emit) {
      emit(CatalogInitial(sorting: state.sorting));
    });
  }

  Future<void> _fetchCatalog(FetchCatalog event, Emitter<CatalogState> emit) async {
    try {
      prevEvent = event;
      emit(CatalogLoading(sorting: state.sorting));
      final products = await apiClient.fetchProductsByCategory(event.categoryId, state.sorting.value);
      emit(CatalogLoaded(products: products, sorting: state.sorting));
    } on Exception catch (e) {
      emit(CatalogFailure(error: e, sorting: state.sorting));
    }
  }

  Future<void> _fetchCatalogByQuery(FetchCatalogByQuery event, Emitter<CatalogState> emit) async {
    try {
      prevEvent = event;
      emit(CatalogLoading(sorting: state.sorting));
      final List<Product> products;
      if (int.tryParse(event.idOrName) != null){
        products = await apiClient.fetchProductsById(event.idOrName, state.sorting.value);
      }
      else{
        products = await apiClient.fetchProductsByName(event.idOrName, state.sorting.value);
      }
      emit(CatalogLoaded(products: products, sorting: state.sorting));
    } on DioException catch (e){
      if (e.type == DioExceptionType.badResponse && e.response?.statusCode == 404){
        emit(CatalogNotFound(sorting: state.sorting));
        return;
      }
      emit(CatalogFailure(error: e, sorting: state.sorting));
    } on Exception catch (e) {
      emit(CatalogFailure(error: e, sorting: state.sorting));
    }
  }

  final PublicApiClient apiClient = GetIt.I<PublicApiClient>();
  CatalogEvent? prevEvent;
}
