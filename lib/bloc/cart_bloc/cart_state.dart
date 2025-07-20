part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();
  
  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final Map<String, ProductInCart> productsInCart;
  final Map<String, Product> products;
  final double totalPrice;

  const CartUpdated({required this.productsInCart, required this.products, required this.totalPrice});

  @override
  List<Object> get props => [productsInCart, products, totalPrice];
}

final class OrderLoading extends CartState {}

final class OrderPlaced extends CartState {}

final class OrderFailure extends CartState {
  final Object error;

  const OrderFailure({required this.error});

  @override
  List<Object> get props => [error];
}