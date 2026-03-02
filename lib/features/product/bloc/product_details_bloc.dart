import 'package:dorimol/api/public_api_client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dorimol/models/product_details.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc() : super(ProductDetailsInitial()) {
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

  final PublicApiClient apiClient = GetIt.I<PublicApiClient>();
}
