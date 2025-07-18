import 'package:dorimol/api/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dorimol/api/models/product.dart';
import 'package:equatable/equatable.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc({required this.apiClient}) : super(CatalogInitial()) {
    on<FetchCatalog>((event, emit) async {
      try {
        emit(CatalogLoading());
        final products = await apiClient.fetchProductsByCategory(event.categoryId);
        emit(CatalogLoaded(products: products));
      } on Exception catch (e) {
        emit(CatalogFailure(error: e));
      }
    });
  }

  final DorimolApiClient apiClient;
}
