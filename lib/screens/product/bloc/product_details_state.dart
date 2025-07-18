part of 'product_details_bloc.dart';

sealed class ProductDetailsState extends Equatable {
  const ProductDetailsState();
  
  @override
  List<Object> get props => [];
}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsLoaded extends ProductDetailsState {
  const ProductDetailsLoaded({required this.productDetails});

  final ProductDetails productDetails;

  @override
  List<Object> get props => super.props..add(productDetails);
}

final class ProductDetailsFailure extends ProductDetailsState {
  const ProductDetailsFailure({required this.error});

  final Object error;

  @override
  List<Object> get props => super.props..add(error);
}