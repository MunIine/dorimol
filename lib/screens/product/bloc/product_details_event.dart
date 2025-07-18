part of 'product_details_bloc.dart';

sealed class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();

  @override
  List<Object> get props => [];
}

class FetchProductDetails extends ProductDetailsEvent {
  const FetchProductDetails({required this.productId});

  final String productId;

  @override
  List<Object> get props => [productId];
}