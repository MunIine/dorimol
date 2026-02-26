import 'package:dorimol/api/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dorimol/models/product_details.dart';
import 'package:equatable/equatable.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc({required this.apiClient}) : super(ProductDetailsInitial()) {
    on<FetchProductDetails>((event, emit) async {
      try {
        emit(ProductDetailsLoading());
        final productDetails = await apiClient.fetchProductDetails(event.productId);
        emit(ProductDetailsLoaded(productDetails: productDetails));
      } on Exception catch (e) {
        emit(ProductDetailsFailure(error: e));
      }
    });
    on<ResetProductDetails>((event, emit) {
      emit(ProductDetailsInitial());
    });
  }

  final DorimolApiClient apiClient;
}
